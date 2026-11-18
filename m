Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60822606A32F
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2026 12:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZmKXvj2/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wwOZqwu/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=I3ugNM3b6XAdtG3bLDrZ0SB8aU1xpjNG3jnlhgWyaOM=; b=ZmKXvj2/8+IKidT3Kt8q/tsPh2
	qWJFd9KVcoNca3pQFu1Al0vZnU5CG3Nt0khNxNVe8aWe65mRCB7lM4wMpHNTW8+ulXIetEKtKlCLn
	b0E1IsPAzDLD+JvRWoTDQESnuH4JgNDs0qJBPyhgVeij83GIpDvSepSv7+k+qCsHM1+PKtwBtWUFa
	gkjq0HWzXEjYWFiWvC/HMlqA32dUl0Vs2fo8x0UjPJShaazzVUaQmuVUA0Drnjs97nQ9fyHEoPw9x
	JyzNbobhnyqLzVHPB0dgfbwlJRcsudzRydy9Lo5hxLiYPZ7oKyhSbY1i5RGeoisa+LJJMeU5xBlam
	68VahUCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTevS-00000008s2q-0PT7;
	Wed, 18 Nov 2026 12:38:10 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTevP-00000008s15-3H5U
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Nov 2026 12:38:09 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso8026225e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Nov 2026 04:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795005485; x=1795610285; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJ0VV9bT726BqR7U9WtLSEERSGHBOqG4sqzOpQlDp4A=;
        b=wwOZqwu/0RI6F/vrsL++6GdGljPYXxlR+AkaMkOHIEPrOmIUHiAYklNN9qGc6TeLac
         5B9CmTf59mtCU6RfVmty45n41vkOJEDLoBZGLp1YBPWETynbBB+FulD9dBdAF2/N+iwA
         skqWl2UqvEJOnpI/ybQZ0fEUy/i2VyWYXRVidA7+caV9YhR7yYIeUDtUYxj/JVx640E5
         K8/+hi4vUOFxzDJ8TDzjf5uK11TIsaaZkTX6v2v6/HKrExNKdBoHIJUHWEJtPUO7SAZD
         /BAb2DEIG72rPaeQNQU6xWyemWuM7MRsrg8OZCbs4IK6qyXOefXEJUwaSKYFZjAdltbV
         69mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005485; x=1795610285;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJ0VV9bT726BqR7U9WtLSEERSGHBOqG4sqzOpQlDp4A=;
        b=l2Kd2lr45GU457pqC9kpSXst+QqEQRY+naBb4Op6PxtezaJykKC6GU9wod/FAQ/luk
         hQ1q/ZxLXxb5eltljfAdvMf4NIHerdutUSAOa2Txf5AgnOmQb9l8s/LT/jARYWYJaDzX
         GDMqFbmf5jHkCBP2mAgdPfdW02WVsBRZk7TD9GgHpgA0vjUaNO2oTCqG1DuWIRKKeta+
         OP97hTNa0m9obuUq4sQ9EIyF0zvVGznzNXnctMftzUnhoStJDBHiW8rxIHbXlI7Y6Ev1
         UNR810Ab2nn0SR/maHilJMGJWY2wf/Pcf5Eru7jiln7O4rix+xYxgoDEIsrDG8DlmbdP
         ykrA==
X-Forwarded-Encrypted: i=1; AL+hErEzkTuH9Nz+0FaV87M73VNJ2uD2n0anPzCvC7KE/1umZBGuk1Jqr2/ZdGYyvynmVRxxwx3Sf9kZAyOXHVYG@lists.infradead.org
X-Gm-Message-State: APuU4Z8UFVknPpRgfO0WM4vaQ01M6Iv0zxA/ze4L73v6iH/2DXXuX6zv
	CnBhDegL2t1PQusQnxwMarge+4zmOQhb2+RBbrkb8GI3usBjVPNK+dE0dHH9bNuQXZs=
X-Gm-Gg: AYBFou1a/aMf82Csicp/1WN910q36rbqNC2ZzC/og9gWVOIOicgxyRNcy2hPb4KhRop
	/7O97s+zCWjXQMbIwM61wmwG7M3Rv1VKyVgHX7keSHp0CFGrfj6p7S4sePvfBQl34qrFOVKV3Ej
	oMXVqGNCUHcy002jn56Pl7b01mw9GX1LOp1nWSknPrPQ2DeyH7ty9qOk4lsPbM6ChIi5PZsVNWS
	FwNbCS3sSj7E21AFuw3Z6ePpaStbeM81mm80NO1d4RMIuxIBFjz2LH2fkLlodOquv6qRaU62S4q
	1GUXzRqfz7xeAhPLprMI5QdzYajY7ciI0lCvsvWQ/283QgFUSCURmo+dAzS9G44dI7UHZK5zWa6
	fHJmdmWtMYSIvoft+PjMLq51vAsYyX8BRPVQGnsuYNBTQ8sZuAJzTiYq/U7chpCeCCzzN4B0XyK
	mlUHBDXRN7d2qDGnQkanH0d1HWlMVvuqhdIB/549SRTgYtTqBiX9fO6bzkku3Gi+xVax0979IAW
	uPvzekFk0mf4EfbuBqNNv7RRFTMgfhpOlrzhHM7Dw1mhaah3T7X3BD47yLoss2wE6d9efu8KJoC
	fZphMWp4lqvxiopSHYh4XGjJ7PCcI/ExYnGbuL9MMNUyOBHPn3RBRa3kcwwHiFfzaCMv2F3R/Bp
	+teWbgs0+8g==
X-Received: by 2002:a05:600c:8b71:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4bb7da2ba0emr41716025e9.29.1795005485104;
        Wed, 18 Nov 2026 04:38:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:6ca2:2772:9e53:115b? ([2a01:e0a:106d:1080:6ca2:2772:9e53:115b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a655f9f4a7sm4725911f8f.34.2026.11.18.04.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:38:04 -0800 (PST)
Message-ID: <51831581-525f-418c-86ea-3b5c6a80709b@linaro.org>
Date: Wed, 18 Nov 2026 13:38:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 00/10] phy/drm: amlogic: Extract Meson HDMI TX PHY into a
 dedicated driver
To: linux-kernel-dev@aliel.fr, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_043807_879946_6E25CF50 
X-CRM114-Status: GOOD (  20.61  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/17/26 20:33, Ronald Claveau via B4 Relay wrote:
> This series moves the Amlogic Meson HDMI TX PHY handling (covering GXBB,
> GXL, GXM, and G12A SoCs) out of the meson_dw_hdmi DRM driver and into a
> dedicated generic PHY driver.
> 
> Until now, meson_dw_hdmi directly manipulated the HHI system controller
> registers (HHI_HDMI_PHY_CNTL0..5) to configure analog parameters, toggle
> resets, and manage power states, as well as manually ungating HDMI
> clocks and power domains already described in the DT.
> 
> By extracting this logic into a standalone PHY driver under
> drivers/phy/amlogic/:
> - Hardware representation in the DT is cleaner, modeling the HDMI TX PHY
>    as a child node of the HHI syscon referenced via standard "phys" and
>    "phy-names" properties.
> - The DRM bridge driver relies on the standard generic PHY API
>    (phy_init, phy_configure, phy_power_on/off, phy_exit) rather than
>    touching syscon registers directly.
> - Legacy DTs lacking the "phys" property remain supported via a
>    temporary fallback helper (meson_hdmi_phy_create_legacy) to preserve
>    backward compatibility to be removed on next phase of component
>    removal.
> 
> Overview of the series:
> - Patches 1-3: Fix compatible matching in meson-gx-hhi-sysctrl bindings,
>    add the new amlogic,meson-hdmi-tx-phy DT schema, and allow the
>    "hdmi-phy" child node under the HHI syscon.
> - Patch 4: Add the new Meson HDMI TX PHY driver implementing the HDMI
>    PHY configuration ops, along with the temporary legacy creation
>    helper.
> - Patch 5: Document the optional "phys" and "phy-names" properties in
>    the amlogic,meson-dw-hdmi binding.
> - Patches 6-7: Clean up manual HHI clock/power-domain writes in
>    meson_dw_hdmi (relying on runtime PM instead) and convert the driver
>    to use the generic PHY framework.
> - Patches 8-10: Add the "hdmi-phy" child node and wire up the "phys"
>    phandle for G12, GXBB, and GXL Device Trees.
> 
> Tested on:
> - Khadas VIM1 (GXL)
> - dtbs_check and dt_binding_check run cleanly with no new warnings.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
> Ronald Claveau (10):
>        dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Fix compatible matching in conditionals
>        dt-bindings: phy: amlogic: Add Meson HDMI TX PHY binding
>        dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Add hdmi-phy child node
>        phy: amlogic: Add Meson HDMI TX PHY driver
>        dt-bindings: display: amlogic,meson-dw-hdmi: Add phys and phy-names
>        drm/meson: dw-hdmi: Drop manual HHI clock and memory PD setup
>        drm/meson: dw-hdmi: Use the generic PHY framework for the HDMI TX PHY
>        arm64: dts: amlogic: Add HDMI TX PHY node for G12
>        arm64: dts: amlogic: Add HDMI TX PHY node for GXBB
>        arm64: dts: amlogic: Add HDMI TX PHY node for GXL
> 
>   .../bindings/display/amlogic,meson-dw-hdmi.yaml    |   8 +
>   .../bindings/phy/amlogic,meson-hdmi-tx-phy.yaml    |  33 +++
>   .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  |  43 ++-
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   7 +
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   7 +
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   7 +
>   drivers/gpu/drm/meson/Kconfig                      |   1 +
>   drivers/gpu/drm/meson/meson_dw_hdmi.c              | 203 ++++++--------
>   drivers/phy/amlogic/Kconfig                        |  11 +
>   drivers/phy/amlogic/Makefile                       |   1 +
>   drivers/phy/amlogic/phy-meson-hdmi-tx.c            | 309 +++++++++++++++++++++
>   include/linux/phy/phy-meson-hdmi-tx.h              |  19 ++
>   12 files changed, 513 insertions(+), 136 deletions(-)
> ---
> base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
> change-id: 20261115-meson-drm-create-hdmitx-phy-4ac40a654d09
> 
> Best regards,
> --
> Ronald Claveau <linux-kernel-dev@aliel.fr>

Overall it's very good, but I would've prefered a more sequencial move
to the PHY driver, with an exact copy of the code and simplification
towards the current PHY code.

Anyway, the sashiko review comments are good, especially the one on
patch 6 to keep the driver working on old DTs, sorry my bad...

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
