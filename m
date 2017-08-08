From: vincent.abriou@st.com (Vincent ABRIOU)
Date: Tue, 8 Aug 2017 10:05:11 +0000
Subject: [PATCH 7/8] drm: Nuke drm_atomic_helper_connector_dpms
In-Reply-To: <20170725080122.20548-8-daniel.vetter@ffwll.ch>
References: <20170725080122.20548-1-daniel.vetter@ffwll.ch>
 <20170725080122.20548-8-daniel.vetter@ffwll.ch>
Message-ID: <462c98df-2633-3c61-9ae6-e567780941c0@st.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org



On 07/25/2017 10:01 AM, Daniel Vetter wrote:
> It's dead code, the core handles all this directly now.
> 
> The only special case is nouveau and tda988x which used one function
> for both legacy modeset code and -nv50 atomic world instead of 2
> vtables. But amounts to exactly the same.
> 
> v2: Rebase over the panel/brideg refactorings in stm/ltdc.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

[...]

>   drivers/gpu/drm/sti/sti_dvo.c                      |  1 -
>   drivers/gpu/drm/sti/sti_hda.c                      |  1 -
>   drivers/gpu/drm/sti/sti_hdmi.c                     |  1 -

Acked-by: Vincent Abriou <vincent.abriou@st.com>

BR
Vincent
