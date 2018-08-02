From: sjg@chromium.org (Simon Glass)
Date: Thu, 2 Aug 2018 14:36:10 -0600
Subject: [PATCH u-boot 2/2] clk: clk_meson: Add mux and div support for
 reparent and rate setting
In-Reply-To: <1532613244-4585-3-git-send-email-narmstrong@baylibre.com>
References: <1532613244-4585-1-git-send-email-narmstrong@baylibre.com>
 <1532613244-4585-3-git-send-email-narmstrong@baylibre.com>
Message-ID: <CAPnjgZ3XnOLJqN1B=rOy7eXhBDc61kLk0tnF+NrCHYtfghE4rA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 26 July 2018 at 07:54, Neil Armstrong <narmstrong@baylibre.com> wrote:
> This patch adds support for :
> - Rate calculation through muxes and generic dividers
> - Basic gate setting propagation
> - Reparenting for muxes
> - Clock rate setting through generic dividers without reparenting
>
> Support is only added to the Composite VPU and VAPB clocks in order
> to support the Video Processing Unit Power Domain clock setup.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/clk_meson.c | 533 +++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 528 insertions(+), 5 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
