Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF0FEB64D9
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Jul 2023 09:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gWeKzAmJPj8NVzxcvta8JuOWZPaK5fFQejg1X/6rJYs=; b=dOy0AIbKa3f17B
	Yt+BBOo1ymEjgd3xS1z10TkUyC4Z8dh4BNMkupmgi+Ny4F8WZ9aPyznGyJdtZlVjr8V5z2Fx/IBYe
	gjkWvpHPsqWileK96h31PA+Mr6s/K7EGssiE4lOk9tjtcYxPzzGR3cJi4/ihxWAkL9q2XMqIQwh+J
	r8Zum6ETBghSu0brnEPVrkR4kjGoKHyaFs8gxdsi8tGO1qd0PoMrBood6lGaRGY0DX2PrgVrpwm6Q
	RQhXGh3ZLJAX2Xs35KxVr+g3FF3JLP3+n9XRkvpkYQkLjEEq3UXLj+b0khhtsjepVTcfcKF3Bu7eA
	NsV+0vACcDBZ84GsMtlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFtSi-007Uai-15;
	Sun, 02 Jul 2023 09:33:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFtSf-007UZX-0x;
	Sun, 02 Jul 2023 09:33:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CDB0E60B42;
	Sun,  2 Jul 2023 09:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4DC4C433C8;
	Sun,  2 Jul 2023 09:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688290420;
	bh=UH1n2yTthj3B7p1yEhf0i44VbnEaiSmdNcGTKxmKXBU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uTdpnM2eJ5SHjIeMagktSTtN8dJrOcIgCvlR4Km4jkNuqP6r3TGNihxgv0kVR0Quq
	 /er/ZPufRiDHyQhVjQ7iaE8ohRYXP763kkPiZu+SXoDCoZ1X4aZ50vLUIkJc3s4BfJ
	 DC6JbT5Req2e+ySIX/L6zFbS3WIAo0/yApEvAy1LGqQeD2BNuPnclCPIeuwWWR3dTt
	 l2zCXB426dzneu37ZoYHxcS6f8Tx62x4vy5Hf1rOJ2B08X6IG8uwEyd8V83gs9eNes
	 7HIpA/x3OH/pQP4azqgTkNL3vkb1gq3NGr/sb3N/ux1uuIkEcSFxHMlxEMAWGQKb/V
	 M469fc2Q+4LTA==
Message-ID: <b907701b-8c5f-095d-0bce-919e1f6bb893@kernel.org>
Date: Sun, 2 Jul 2023 11:33:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] dt-bindings: reset: Add compatible and DT bindings
 for Meson-C3 Reset Controller
Content-Language: en-US
To: zelong dong <zelong.dong@amlogic.com>, narmstrong@baylibre.com,
 p.zabel@pengutronix.de, khilman@baylibre.com,
 Rob Herring <robh+dt@kernel.org>, martin.blumenstingl@googlemail.com
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com,
 devicetree@vger.kernel.org, kelvin.zhang@amlogic.com
References: <20230630121059.28748-1-zelong.dong@amlogic.com>
 <20230630121059.28748-2-zelong.dong@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230630121059.28748-2-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_023341_420362_57C7CC9D 
X-CRM114-Status: GOOD (  10.40  )
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

On 30/06/2023 14:10, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add new compatible and DT bindings for Amlogic's Meson-C3 Reset Controller
> 
> Change-Id: Ie8941818bde5b736689e43367f66827c5bc0449e

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
