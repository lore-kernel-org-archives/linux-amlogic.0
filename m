From: greg@kroah.com (Greg KH)
Date: Thu, 26 Apr 2018 19:45:56 +0200
Subject: [PATCH stable] drm: bridge: dw-hdmi: Fix overflow workaround for
 Amlogic Meson GX SoCs
In-Reply-To: <1524128048-11086-1-git-send-email-narmstrong@baylibre.com>
References: <1524128048-11086-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <20180426174556.GB28091@kroah.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Apr 19, 2018 at 10:54:08AM +0200, Neil Armstrong wrote:
> commit 9c305eb442f3b371fc722ade827bbf673514123e upstream
> 
> The Amlogic Meson GX SoCs, embedded the v2.01a controller, has been also
> identified needing this workaround.
> This patch adds the corresponding version to enable a single iteration for
> this specific version.
> 
> Fixes: be41fc55f1aa ("drm: bridge: dw-hdmi: Handle overflow workaround based on device version")
> Acked-by: Archit Taneja <architt@codeaurora.org>
> [narmstrong: s/identifies/identified and rebased against Jernej's change]
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/1519386277-25902-1-git-send-email-narmstrong at baylibre.com
> [narmstrong: v4.14 to v4.16 backport]
> Cc: <stable@vger.kernel.org> # 4.14.x

Now applied, thanks.

greg k-h
