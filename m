Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01790C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Feb 2022 08:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rf9cYnAU8UzSilyxJVIKfoaGlFNi5u+cQaD6AoNMwTI=; b=nPuc6+Ef4cjHQA
	WtM31DJi6EQfypojPFi0Rj7GJQQQckoyQUlCe4FrTV+3qlm81p5VsUN0UXxTIrqz7NTR/DxXOlApw
	ybHHByDbBGxyVD/gRPHIUB8BycIC3BcD57AEKdlASn0asuo4mWGWfXkpiBR2kJ1ZucTTjwtVUO5nz
	VanC+VPzobjrTQdmGZBaKrv2cX/Y5E5GhgcKhsPKMpJqO+Tr6wKTaWxX3I9L0V9KW7wzSsX+Epdea
	Yfk/Vg5u3ft3bY5HftFQY8fM9t7zKi4NnWs8xmjbMXytYBwkgC5Zwduv8Uv2QUefarWcp3nNt705T
	6EgC7OZXOu6X2UdDzeaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM40Q-004GhT-W4; Mon, 21 Feb 2022 08:25:15 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM40N-004GfU-0d
 for linux-amlogic@lists.infradead.org; Mon, 21 Feb 2022 08:25:13 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 p14-20020a05600c1d8e00b0037f881182a8so785193wms.2
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Feb 2022 00:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HtxBmeOXC9JY2medDRrYSSTNzMcetLrIdHLgGlB77Vo=;
 b=kZj0ZPJi5Rn/Ledb5Qn5+fHEFZqPJV8hDipfpQa+OlYs3IGumEzDR3Ko5IziRAYDtk
 OY0aRY/Ln+wFUiAJ350VXcf1vBGH9nMtgnxWfbtRV/78G6gxbz3kqDjSL6kOktJN8Ad3
 DvBvd/4imz+F/6NtHWFxKe8gThzidTTBkbwv1tv45cM/FFu0hdq+Nn6+sg9wayudfzd0
 S8s6e36z7F7pR1Um/NLEXHoF//puL0VwVu8O5I+pPMMwoFKQqDmKHDg//8+fnb9lctVg
 IYwaaenDBbVPV/d8Bvh+Ug28MP/okaFK/YFXRY0qm4sHteBreuGvIiA9VkTkCEqJwHic
 ATJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HtxBmeOXC9JY2medDRrYSSTNzMcetLrIdHLgGlB77Vo=;
 b=I3xtv3OaFR60tiE96UyQLhMJ2wU40ACTsU3LOBue2OEl5BpPT9L3zkxH/a3Bt82YFL
 rDYaPH+1WWEJLdRnat2xKG+7j3Ada5zokViFdCVewnIDtQd6KHyb7GqDO7CbYPb7CLMy
 UpDEqfiTNLM1fFQkeoW6drgKF4XJ7hZIH02TCmflStQUedSN09LdzcHL475Gn75V7LTL
 d2gYQuDhfW/rMlPLD+WsKsh6jV7uG77uwnEQTBgaPqr81gZQCoDVPG1wfE6P5OPpNoEa
 oHA9SP8zIHfffB1iuKee6TcpC4I3ayNOmOb0lXbj6uZI7eMJIcAl69tLc8UJJTjlFw2l
 bYJA==
X-Gm-Message-State: AOAM531hGLCYOzESMLTUJvMOcu7LPCX3SYPdP+0pA6ta3C8Q4zXHt/LT
 EYPVKLcU2JExt4ySsIz0u8bipA==
X-Google-Smtp-Source: ABdhPJwfUY2Exdd7ZUJLotq3D3qwt70QY/uo/prkHK4RJ7kTBcqoqAfFpREMtYJAF62kh96pY29mPw==
X-Received: by 2002:a1c:6a03:0:b0:37b:dda6:4259 with SMTP id
 f3-20020a1c6a03000000b0037bdda64259mr20501670wmc.20.1645431909129; 
 Mon, 21 Feb 2022 00:25:09 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:77b7:547a:df0c:28d8])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a05600c379900b0037bbafa37easm6732025wmr.31.2022.02.21.00.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 00:25:08 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org,
 Christian Hewitt <christianshewitt@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Sam Nazarko <email@samnazarko.co.uk>, Chad Wagner <wagnerch42@gmail.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: meson: add support for OSMC Vero 4K+
Date: Mon, 21 Feb 2022 09:25:06 +0100
Message-Id: <164543190117.17295.2849143887503486162.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211105311.30320-1-christianshewitt@gmail.com>
References: <20220211105311.30320-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_002511_085488_0730C889 
X-CRM114-Status: GOOD (  11.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Fri, 11 Feb 2022 10:53:08 +0000, Christian Hewitt wrote:
> This series adds support for the OSMC Vero 4K+ Set-Top Box device
> based on the Amlogic GXL (S905D) chipset. The Vero 4k+ is notable
> for being an original Linux (not Android) STB device, running its
> own Debian-derived 'OSMC' distro. Big thanks to Chad Wagner for his
> help with testing and device-tree fettling.
> 
> Changes since v1:
> - Address device-tree comments from Neil
> - Add Neil's reviewed-by to patch 3
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.18/dt64)

[1/3] dt-bindings: vendor-prefixes: add osmc prefix
      https://git.kernel.org/amlogic/c/41654043226f517a8b37cab34f1eab5c6ef16947
[2/3] dt-bindings: arm: amlogic: add Vero 4K+ bindings
      https://git.kernel.org/amlogic/c/3f7dbd336f360a76103153b85ce616b86d85c6cd
[3/3] arm64: dts: meson: add support for OSMC Vero 4K+
      https://git.kernel.org/amlogic/c/d926a4fe25338e120ab49547de9707dc6e5e5824

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
