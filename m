From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 16 Jul 2018 11:18:08 +0200
Subject: [PATCH RESEND] drm/meson: Make DMT timings parameters and pixel
 clock generic
In-Reply-To: <1531730163.12853.10.camel@baylibre.com>
References: <1531726814-14638-1-git-send-email-narmstrong@baylibre.com>
 <1531730163.12853.10.camel@baylibre.com>
Message-ID: <ca08e095-2e7b-58b8-e5cf-db44fe67280b@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 16/07/2018 10:36, Jerome Brunet wrote:
> On Mon, 2018-07-16 at 09:40 +0200, Neil Armstrong wrote:
>> Remove the modes timings tables for DMT modes and calculate the HW
>> paremeters from the modes timings.
>>
>> Switch the DMT modes pixel clock calculation out of the static frequency
>> list to a generic calculation from a range of possible PLL dividers.
>>
>> This patch is an intermediate step towards usage of the Common Clock
>> Framwework for PLL setup, by reworking the code to have common
>> sel_pll() function called by the CEA (HDMI) freq setup and the generic
>> DMT frequencies setup, we should be able to simply call clk_set_rate()
>> on the PLL clock handle in a near future.
>>
>> The CEA (HDMI) and CVBS modes needs very specific clock paths that CCF will
>> never be able to determine by itself, so there is still some work to do for
>> a full handoff to CCF handling the clocks.
> 
> Patch seems to be a good step forward making the display compatible with CCF
> indeed. While full automatic handling through CCF might not possible, it would
> be good if, someday,  we could handle the SoC quirks in CCF, removing the need
> check is the SoC is gxbb, gxl or gxm while setting the clocks.
> 
> If the display driver needs a detailed control over the clock setup, maybe we
> could solve the problem by exporting the intermediate clock elements in CCF
> (such as muxes, ODs, etc...) and let the display driver claim them all ?
> 
> Anyway, the situation is improving so:
> Acked-by: Jerome Brunet <jbrunet@baylibre.com>
> 
>>
>> This setup permits setting non-CEA modes like :
>> - 1600x900-60Hz
>> - 1280x1024-75Hz
>> - 1280x1024-60Hz
>> - 1440x900-60Hz
>> - 1366x768-60Hz
>> - 1280x800-60Hz
>> - 1152x864-75Hz
>> - 1024x768-75Hz
>> - 1024x768-70Hz
>> - 1024x768-60Hz
>> - 832x624-75Hz
>> - 800x600-75Hz
>> - 800x600-72Hz
>> - 800x600-60Hz
>> - 640x480-75Hz
>> - 640x480-73Hz
>> - 640x480-67Hz
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/gpu/drm/meson/meson_dw_hdmi.c |  22 +-
>>  drivers/gpu/drm/meson/meson_vclk.c    | 672 +++++++++++++++-------------------
>>  drivers/gpu/drm/meson/meson_vclk.h    |   4 +
>>  drivers/gpu/drm/meson/meson_venc.c    | 377 +++----------------
>>  drivers/gpu/drm/meson/meson_venc.h    |   3 +-
>>  5 files changed, 358 insertions(+), 720 deletions(-)
>>
[...]


Applied to drm-misc-next with some trivial checkpatch fixes.
