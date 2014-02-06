module graphics.graphics;
import graphics.adapters, graphics.shaders.shaders;

static class Graphics
{
static:
public:
	Adapter adapter;
	alias adapter this;

	/**
	 * Initialize the controllers.
	 */
	void initialize()
	{
		version( Windows )
		{
			adapter = new Win32;
		}
		else version( OSX )
		{
			adapter = new Mac;
		}
		else version( linux )
		{
			adapter = new Linux;
		}
		else
		{
			adapter = null;
		}

		adapter.initialize();
		adapter.initializeDeferredRendering();
		Shaders.initialize();
	}

	/**
	 * Shutdown the adapter and shaders.
	 */
	void shutdown()
	{
		Shaders.shutdown();
		adapter.shutdown();
	}
}
