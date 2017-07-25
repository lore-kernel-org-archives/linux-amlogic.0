From: architt@codeaurora.org (Archit Taneja)
Date: Tue, 25 Jul 2017 15:00:19 +0530
Subject: [PATCH 7/8] drm: Nuke drm_atomic_helper_connector_dpms
In-Reply-To: <20170725080122.20548-8-daniel.vetter@ffwll.ch>
References: <20170725080122.20548-1-daniel.vetter@ffwll.ch>
 <20170725080122.20548-8-daniel.vetter@ffwll.ch>
Message-ID: <250ddff2-61ef-4e9e-5312-87014bb4b285@codeaurora.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org



On 07/25/2017 01:31 PM, Daniel Vetter wrote:
> It's dead code, the core handles all this directly now.
> 
> The only special case is nouveau and tda988x which used one function
> for both legacy modeset code and -nv50 atomic world instead of 2
> vtables. But amounts to exactly the same.
> 
> v2: Rebase over the panel/brideg refactorings in stm/ltdc.

s/brideg/bridge

<snip>


> ---
>   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  1 -
>   drivers/gpu/drm/bridge/analogix-anx78xx.c          |  1 -
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  1 -
>   drivers/gpu/drm/bridge/dumb-vga-dac.c              |  1 -
>   .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |  1 -
>   drivers/gpu/drm/bridge/nxp-ptn3460.c               |  1 -
>   drivers/gpu/drm/bridge/panel.c                     |  1 -
>   drivers/gpu/drm/bridge/parade-ps8622.c             |  1 -
>   drivers/gpu/drm/bridge/sii902x.c                   |  1 -
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  1 -
>   drivers/gpu/drm/bridge/tc358767.c                  |  1 -
>   drivers/gpu/drm/bridge/ti-tfp410.c                 |  1 -

For bridge changes:

Acked-by: Archit Taneja <architt@codeaurora.org>

Archit

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
