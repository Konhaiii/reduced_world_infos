package konhaiii.reduced_world_infos.client.mixin;

import net.minecraft.client.multiplayer.ClientLevel;
import net.minecraft.client.renderer.item.properties.numeric.CompassAngleState;
import net.minecraft.core.component.DataComponents;
import net.minecraft.util.Mth;
import net.minecraft.world.entity.ItemOwner;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.component.LodestoneTracker;
import org.spongepowered.asm.mixin.Final;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.Shadow;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfoReturnable;

@Mixin(CompassAngleState.class)
public class CompassDirectionMixin {

	@Final
	@Shadow
	private CompassAngleState.CompassTarget compassTarget;

	@Inject(method = "calculate", at = @At("HEAD"), cancellable = true)
	private void compassNorthOnlyForSpawn(ItemStack itemStack, ClientLevel level, int seed, ItemOwner owner, CallbackInfoReturnable<Float> cir) {
		if (owner == null) return;

		if (this.compassTarget != CompassAngleState.CompassTarget.SPAWN) {
			return;
		}

		LodestoneTracker tracker = itemStack.get(DataComponents.LODESTONE_TRACKER);
		if (tracker != null && tracker.target().isPresent()) {
			return;
		}

		float rotation = Mth.positiveModulo(owner.getVisualRotationYInDegrees() / 360.0F, 1.0F);
		float angle = 0.5F - rotation;

		cir.setReturnValue(Mth.positiveModulo(angle, 1.0F));
	}
}