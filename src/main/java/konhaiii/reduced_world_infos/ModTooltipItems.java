package konhaiii.reduced_world_infos;

import net.minecraft.ChatFormatting;
import net.minecraft.core.component.DataComponents;
import net.minecraft.nbt.CompoundTag;
import net.minecraft.network.chat.CommonComponents;
import net.minecraft.network.chat.Component;
import net.minecraft.world.item.Item;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.TooltipFlag;
import net.minecraft.world.item.component.CustomData;
import net.minecraft.world.item.component.TooltipDisplay;

import java.util.function.Consumer;

public class ModTooltipItems extends Item {
	public ModTooltipItems(Properties properties) {
		super(properties);
	}

	@Override
	public void appendHoverText(ItemStack stack, TooltipContext context, TooltipDisplay displayComponent, Consumer<Component> textConsumer, TooltipFlag type) {
		if (stack.getItem() == ModItems.CALIBRATION_SHARD) {
			textConsumer.accept(Component.translatable("item.reduced_world_infos.calibration_shard.desc1").withStyle(ChatFormatting.GRAY));
			textConsumer.accept(Component.translatable("item.reduced_world_infos.calibration_shard.desc2").withStyle(ChatFormatting.GRAY));
		} else if (stack.getItem() == ModItems.LOGBOOK) {
			CustomData customData = stack.get(DataComponents.CUSTOM_DATA);
			if (customData != null) {
				CompoundTag tag = customData.copyTag();
				String currentMode = "item.reduced_world_infos.logbook_mode.desc1";

				if (tag.getString("current_mode").orElse("").equals("attuned_clock")) {
					currentMode = "item.reduced_world_infos.logbook_mode.desc2";
				} else if (tag.getString("current_mode").orElse("").equals("biome_recognizer")) {
					currentMode = "item.reduced_world_infos.logbook_mode.desc3";
				} else if (tag.getString("current_mode").orElse("").equals("calibration_shard")) {
					currentMode = "item.reduced_world_infos.logbook_mode.desc4";
				} else if (tag.getString("current_mode").orElse("").equals("clock")) {
					currentMode = "item.reduced_world_infos.logbook_mode.desc5";
				} else if (tag.getString("current_mode").orElse("").equals("compass")) {
					currentMode = "item.reduced_world_infos.logbook_mode.desc6";
				} else if (tag.getString("current_mode").orElse("").equals("light_meter")) {
					currentMode = "item.reduced_world_infos.logbook_mode.desc7";
				}
				textConsumer.accept(
						Component.translatable("item.reduced_world_infos.logbook.desc1").withStyle(ChatFormatting.GRAY)
								.append(CommonComponents.space().append(Component.translatable(currentMode)).withStyle(ChatFormatting.GOLD)));
				textConsumer.accept(CommonComponents.EMPTY);
				textConsumer.accept(
						Component.translatable("item.reduced_world_infos.logbook.desc2",
								Component.keybind("key.use")).withStyle(ChatFormatting.GRAY));
				textConsumer.accept(Component.translatable("item.reduced_world_infos.logbook.desc3").withStyle(ChatFormatting.GRAY));
				textConsumer.accept(
						Component.translatable("item.reduced_world_infos.logbook.desc4",
								Component.keybind("key.use")).withStyle(ChatFormatting.GRAY));
				textConsumer.accept(
						Component.translatable("item.reduced_world_infos.logbook.desc5",
								Component.keybind("key.sneak"),
								Component.keybind("key.use")
						).withStyle(ChatFormatting.GRAY));
			}
		}
	}
}
