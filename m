From: sjg@chromium.org (Simon Glass)
Date: Sat, 31 Mar 2018 16:44:16 +0800
Subject: [PATCH u-boot] reset: Add get/assert/deassert/release for bulk of
 reset signals
In-Reply-To: <1522400090-13501-1-git-send-email-narmstrong@baylibre.com>
References: <1522400090-13501-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <CAPnjgZ0o=gz1ZjSxNOV+8rg7mL8ELtHgQaCLxwBS9w7c2y8azA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Neil,

On 30 March 2018 at 16:54, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This patch adds a "bulk" API to the reset API in order to get/deassert/
> assert/release a group of reset signals associated with a device.
>
> This bulk API will avoid adding a copy of the same code to manage
> a group of reset signals in drivers.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> This serie and the "clk bulk" serie is necessary and suggested by Marek Vasut
> for the "Add USB Support for Amlogic Meson GXL SoCs" to avoid adding the same
> code to manage a bulk of clocks and resets in another driver.
> I will push a RFC code to update the other drivers having a similar
> code pattern when these patches are merged.
>
>  drivers/reset/reset-uclass.c | 60 +++++++++++++++++++++++++++
>  include/reset.h              | 99 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 159 insertions(+)
>

This looks good. Please can you add a sandbox test?

Regards,
Simon
