From: sjg@chromium.org (Simon Glass)
Date: Sat, 31 Mar 2018 16:42:08 +0800
Subject: [PATCH u-boot] clk: Add get/enable/disable/release for a bulk of
 clocks
In-Reply-To: <1522400029-13321-1-git-send-email-narmstrong@baylibre.com>
References: <1522400029-13321-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <CAPnjgZ2QzaA3gDEi870Q5sGoF77P1sgTAf4pCC+R+6z32Btg7A@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 30 March 2018 at 16:53, Neil Armstrong <narmstrong@baylibre.com> wrote:
> This patch adds a "bulk" API to the clock API in order to get/enable/disable
> /release a group of clocks associated with a device.
>
> This bulk API will avoid adding a copy of the same code to manage
> a group of clocks in drivers.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> This serie and the "reset bulk" serie is necessary and suggested by Marek Vasut
> for the "Add USB Support for Amlogic Meson GXL SoCs" to avoid adding the same
> code to manage a bulk of clocks and resets in another driver.
> I will push a RFC code to update the other drivers having a similar
> code pattern when these patches are merged.
>
>  drivers/clk/clk-uclass.c | 59 +++++++++++++++++++++++++++++++++++++++
>  include/clk.h            | 72 +++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 130 insertions(+), 1 deletion(-)
>

This looks good. Please can you add a sandbox test?

Regards,
Simon
