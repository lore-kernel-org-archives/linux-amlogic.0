Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB6DCA9EBD
	for <linux-amlogic@archiver.kernel.org>; Sun, 11 Oct 2026 21:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1NLDYAR7g4t25gfFHdR7ZiRGyETtYR7mN+FamzrIJjA=; b=vdjkJuWb8AZtcZ3T4myYJkgPu7
	2NNbvYUKznLTVNI3DmUdhAo/WN2Fh9SnhbsoJDJkEXeJwVC79jD0FqU5Fkj92sEs1Wke7MGWIi9Ny
	Ck8SldQwQH+bNBQKAFWMJMpGoFeTqvuew7uqnwj8OjldV+mZGqJWYdJBzzvP6b5zLWFM/RHYskodd
	zaCOV21dIPrQ5wW3ntnZLxhhq8Ls4LY8HBR2h/vxhA+AvFzUJiz16Xb8b+yKbvQFP3H7YpjZ9PsdE
	rQUIyYsrBzJsSsSTgYc+oX+lHxVSOvpieUOAfzeZHBbb8V/6fgf53ajDR04I3qAy0WVU2FziIWTTK
	Pr/Z2l3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG0eJ-00000009PV7-14DS;
	Sun, 11 Oct 2026 21:00:03 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG0eF-00000009PTm-3ejk
	for linux-amlogic@lists.infradead.org;
	Sun, 11 Oct 2026 21:00:01 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso12559625e9.3
        for <linux-amlogic@lists.infradead.org>; Sun, 11 Oct 2026 13:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791752397; x=1792357197; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GXE8pfEZXuSFtvC6/Tl1P1F3UmZY6SoQVpTiEIRx1zo=;
        b=hB6gXKPg4HLsgZ8NY+DMafZ0yGBStu90cKEJSzBNvASb/kyO1nBUUidaG9LYFtA9QS
         dtlo/CK0v1/tl10uTbQMqP13ODRKOSc8vogbIzcr//e598M4dDesQtR1ehXkAFoFJu7M
         92Zyys3JWfxWZUHbvYsdrw8sHKStR++fgJ2Gm0hmuX6Ia1fFZRKtNkKoenWd7irsup3v
         fBGJzZ/OmyXgqAr0UsZ0V1Gf57/iA2vspFGyrP0yPJy1q0Tv+ElVqm4SGoFj/yL5GAxX
         tkaCdb895tNobKioXytDvhoA+MJFtp8kxcKHklm6cKKb/01LR2DRwck4yldOMnNbZpCj
         oPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791752397; x=1792357197;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXE8pfEZXuSFtvC6/Tl1P1F3UmZY6SoQVpTiEIRx1zo=;
        b=hUrPE8fDiuMOsNwaVri/v+7BiD0u4aLq9zue3Gj+jZx6DZTokg9Ak3YLFgXtJf6gws
         jfLxIzUzClUnju+Pz/Vjmm/rfGbpiqktIZmvNjZJ14cTjY3lLVbWLMvo73YNMaOSaT5u
         rPC7R3V16+uLTYvjRnp3eurGKPWKDoRhu5ODXCRfCj9cH4Q+6a0N3d3rAa4EZkVsIQbT
         ImK2vVWcRu6OehArMaB2yzM9hnPIFmzohMB7RQ5ZmFF4uJUE6zt1a2lM5qQWZoKYQNON
         CfvLm61tiTg4lyjr7WVikQh7WLBc8g/fxWCkw9czr1/8ZRsK4UgG+qoTRfQ+l/aVZxw3
         dX2w==
X-Forwarded-Encrypted: i=1; AKwUvBzWL74rvcw8VfxTFoDu5t6tQBvJBbUNJFFaLRyik2nm9cauP7gZaTOyc2MtWSic8fiw3gOiDrk5bhqMPNct@lists.infradead.org
X-Gm-Message-State: AFq9FYIU38isVe7NrNTBLa1/2WilSkQTGAui51ei2q5lZP5PtEgGttAP
	1T9k2As4/jCqD9CJI3r3nrcIAC9sCFBEddivZt8PVPqICrqV9ivMFcfq
X-Gm-Gg: AYBFou2/Xs1Awx071OyJk3HC3IEm+eUTqWHGqqr929D3pKsX3TpVhuuWhMWeeeh1WA5
	kmwJkENtIXQC4cULn4UnctdnTiaSiiiM+d4iroLKTiWzWb1acDsoblC2RpdA/ZjN7yp8QsJkNry
	zRtK93CaAorMOV5GW6/BO6sSxnRCbQNCudbpyXFICKjLYOD9yQZZAqLxQ06M4SmNdBJ+4+hNEzF
	qjXiqHo5VIJi8LF9LGELL0/+XHW3h7qzldmGnp5PLMk20j7jORqiV6OmIzsbEFC62UZV5tMiQ2S
	i9mLYd9ASe3eESWxWIs7cloyFqlYQCfmH1ClrBcLfxh6lKML5Hz0bNpKSkQ8u7i/7Eb2h7ScHrS
	/zsC5JEUJslaSIS4EKLhLwGtFtxj7Ag4NQnNxg+bC18xPIs0cWd0SrL97E6UgF/F5pxJVgqM988
	ENYFKr4pk11Qkbd4G6qxfgNNGFYNe96PVQH45ItsznpBk47NRebjYTceX1LfL0Cy8voH9X5Ejer
	hnL31FEQ0epD2cBbD8d9oQ/EMZtwU71E3pPZvNe9WFr7X5uPYWhAmqHYg==
X-Received: by 2002:a05:600c:3f0f:b0:49c:ffab:551f with SMTP id 5b1f17b1804b1-4a18e4cd231mr144688665e9.22.1791752397395;
        Sun, 11 Oct 2026 13:59:57 -0700 (PDT)
Received: from [127.0.1.1] (ip-024-215.users.dtel.ru. [91.210.24.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19c8244edsm67465395e9.2.2026.10.11.13.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 13:59:56 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: meson-gxbb-odroidc2: read the Ethernet
 MAC address from eFuse
In-Reply-To: <CAFBinCAOsJG=ROP43+pj9dqYc4yWXs4RQisRZghqzbtspp=e7A@mail.gmail.com>
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
 <20261011-odroidc2-dts-v2-1-a3a4a752f2ab@gmail.com>
 <CAFBinCAOsJG=ROP43+pj9dqYc4yWXs4RQisRZghqzbtspp=e7A@mail.gmail.com>
Date: Sun, 11 Oct 2026 23:59:39 +0300
Message-ID: <179175237937.1513478.8957286812154054574@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_135959_931272_1A51BF62 
X-CRM114-Status: GOOD (  11.08  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="fixed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

On Sun, Oct 11, 2026 at 10:49 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> Question to Neil: should the eth_mac node be moved from meson-gx.dtsi
> to meson-gxbb-odroidc2.dts?
> Odroid-C2 would be the only board using it and u-boot seems to derive
> MAC from SoC chip ID/serial number instead of reading it from eFuse
> (so I'm not sure about the status of MAC address in eFuse on most
> boards).

Some data points in case they help Neil decide:

- Mainline U-Boot does read the eFuse first on the GX reference board
  files: board/amlogic/p200 (used by odroid-c2_defconfig), p201, p212
  and q200 all call meson_sm_read_efuse(EFUSE_MAC_OFFSET = 52, 6 bytes)
  and only fall back to meson_generate_serial_ethaddr() when that does
  not give a valid address.

- On my ODROID-C2 the eFuse at 0x34 holds 00:1e:06:37:d9:37, i.e.
  Hardkernel's OUI, and that is what U-Boot passes on today.

I can't say how many other GX boards have the eFuse programmed, so I
have no strong opinion on where the node should live. Happy to respin
with the cell moved into the board file if that is preferred.

Thanks for the review,
Fil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
