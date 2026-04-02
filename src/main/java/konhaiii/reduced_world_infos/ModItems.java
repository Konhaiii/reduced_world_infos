package konhaiii.reduced_world_infos;

import net.fabricmc.fabric.api.itemgroup.v1.FabricItemGroup;
import net.minecraft.core.Registry;
import net.minecraft.core.component.DataComponents;
import net.minecraft.core.registries.BuiltInRegistries;
import net.minecraft.core.registries.Registries;
import net.minecraft.nbt.CompoundTag;
import net.minecraft.network.chat.Component;
import net.minecraft.resources.Identifier;
import net.minecraft.resources.ResourceKey;
import net.minecraft.world.item.*;
import net.minecraft.world.item.component.Consumable;
import net.minecraft.world.item.component.CustomData;

import java.util.function.Function;

import static net.minecraft.world.item.component.Consumables.defaultFood;

public class ModItems {
	public static <GenericItem extends Item> GenericItem register(String name, Function<Item.Properties, GenericItem> itemFactory, Item.Properties settings) {
		// Create the item key.
		ResourceKey<Item> itemKey = ResourceKey.create(Registries.ITEM, Identifier.fromNamespaceAndPath(ReducedWorldInfos.MOD_ID, name));

		// Create the item instance.
		GenericItem item = itemFactory.apply(settings.setId(itemKey));

		// Register the item.
		Registry.register(BuiltInRegistries.ITEM, itemKey, item);

		return item;
	}

	public static final Consumable USABLE_CONSUMABLE = defaultFood().consumeSeconds(2147483647F).animation(ItemUseAnimation.BLOCK).build();

	public static final Item ALTIMETER = register("altimeter", Item::new, new Item.Properties());
	public static final Item ATTUNED_CLOCK = register("attuned_clock", Item::new, new Item.Properties());
	public static final Item BIOME_RECOGNIZER = register("biome_recognizer", Item::new, new Item.Properties());
	public static final Item CALIBRATION_SHARD = register("calibration_shard", ModTooltipItems::new, new Item.Properties().rarity(Rarity.UNCOMMON).stacksTo(8));
	public static final Item LIGHT_METER = register("light_meter", Item::new, new Item.Properties().stacksTo(1));
	public static final Item LOGBOOK = register("logbook", ModTooltipItems::new, new Item.Properties().component(DataComponents.CONSUMABLE, USABLE_CONSUMABLE).component(DataComponents.CUSTOM_DATA, logbookDefaultData()).stacksTo(1));

	private static CustomData logbookDefaultData() {
		CompoundTag tag = new CompoundTag();
		tag.putString("relative_x", "none");
		tag.putString("relative_z", "none");
		return CustomData.of(tag);
	}

	public static void initialize() {
		Registry.register(BuiltInRegistries.CREATIVE_MODE_TAB, REDUCED_WORLD_INFOS_CREATIVE_TAB_KEY, REDUCED_WORLD_INFOS_CREATIVE_TAB);
	}

	public static final ResourceKey<CreativeModeTab> REDUCED_WORLD_INFOS_CREATIVE_TAB_KEY = ResourceKey.create(BuiltInRegistries.CREATIVE_MODE_TAB.key(), Identifier.fromNamespaceAndPath(ReducedWorldInfos.MOD_ID, "creative_tab"));
	public static final CreativeModeTab REDUCED_WORLD_INFOS_CREATIVE_TAB = FabricItemGroup.builder()
			.icon(() -> new ItemStack(ModItems.LOGBOOK))
			.title(Component.translatable("itemGroup.reduced_world_infos"))
			.displayItems((params, output) -> {
				output.accept(LOGBOOK);
				output.accept(ALTIMETER);
				output.accept(ATTUNED_CLOCK);
				output.accept(BIOME_RECOGNIZER);
				output.accept(CALIBRATION_SHARD);
				output.accept(LIGHT_METER);
			})
			.build();
}
