From: greg@kroah.com (Greg KH)
Date: Thu, 19 Apr 2018 10:27:51 +0200
Subject: [PATCH] drm: bridge: dw-hdmi: Fix overflow workaround for
 Amlogic Meson GX SoCs
In-Reply-To: <3b17d17b-cf3d-be54-2462-191e4f2af653@baylibre.com>
References: <1519386277-25902-1-git-send-email-narmstrong@baylibre.com>
 <3b17d17b-cf3d-be54-2462-191e4f2af653@baylibre.com>
Message-ID: <20180419082751.GA23187@kroah.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Apr 19, 2018 at 10:18:35AM +0200, Neil Armstrong wrote:
> Hi Greg,
> 
> On 23/02/2018 12:44, Neil Armstrong wrote:
> > The Amlogic Meson GX SoCs, embedded the v2.01a controller, has been also
> > identified needing this workaround.
> > This patch adds the corresponding version to enable a single iteration for
> > this specific version.
> > 
> > Fixes: be41fc55f1aa ("drm: bridge: dw-hdmi: Handle overflow workaround based on device version")
> > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> This patch is now present in linux master as commit 9c305eb442f3b371fc722ade827bbf673514123e
> Could it be selected for 4.14 ?
> The patch has been reworked to apply for 4.17 as indicated in the commit log, but the original patch will apply over 4.14.

I don't have any "original" patch here, I just tried applying it to
4.16.y and 4.14.y and it did not work.  Can you please provide a working
backport?

thanks,

greg k-h
