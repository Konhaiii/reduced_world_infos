package konhaiii.reduced_world_infos;

import net.fabricmc.api.ModInitializer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ReducedWorldInfos implements ModInitializer {
	public static final String MOD_ID = "reduced_world_infos";
	public static final Logger LOGGER = LoggerFactory.getLogger(MOD_ID);

	@Override
	public void onInitialize() {
		ModItems.initialize();
		LOGGER.info("Reduced World Infos: Initialized");
	}
}