From: sjg@chromium.org (Simon Glass)
Date: Wed, 4 Apr 2018 01:53:43 +0800
Subject: [PATCH v2 u-boot 1/2] clk: Add get/enable/disable/release for a
 bulk of clocks
In-Reply-To: <1522748659-21622-2-git-send-email-narmstrong@baylibre.com>
References: <1522748659-21622-1-git-send-email-narmstrong@baylibre.com>
 <1522748659-21622-2-git-send-email-narmstrong@baylibre.com>
Message-ID: <CAPnjgZ1MzxP+OBT4AkSV9G2MN5PQ0_AKMiqpp-B+W0bzEZrOPQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 3 April 2018 at 17:44, Neil Armstrong <narmstrong@baylibre.com> wrote:
> This patch adds a "bulk" API to the clock API in order to get/enable/disable
> /release a group of clocks associated with a device.
>
> This bulk API will avoid adding a copy of the same code to manage
> a group of clocks in drivers.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/clk-uclass.c | 59 +++++++++++++++++++++++++++++++++++++++
>  include/clk.h            | 72 +++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 130 insertions(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
