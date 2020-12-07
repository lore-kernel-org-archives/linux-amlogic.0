Return-Path: <SRS0=a8bK=FL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8184DC433FE
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 19:16:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FA7C23432
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 19:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FA7C23432
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxxDG3PrOnlcX+sHd7hJHM5R0GjQd+E5GKt7w9OsRq4=; b=O/m33ZHaoJV/4RVaMdaiIMCdFp
	DtWfVB1/74K182XXPJsu05qAgpTZvLgrkQQW7nerb0kKm20FjDj+YUr9uF9IXOfCZfUoeHewXkKTH
	FXq6R2jAI9IzGOxks0f7ZunpoD86xLrt6rxBh/F47/pTmctc2jriXvEmNT+N3zH5bAT6IrvPgVRXg
	P1YpARiIrwquWArN/nxbmIH+EJPE9BwM+I91wlueOlCkhZ1jT5nbm0VlJuGsVWLsoK3M4nPwSUIYl
	6SkLWOwCq+bJnc4VphisBW/vEwSMLX4ecxwTm1MUTJGjNAFO3grr6UtCtc78Q0TrKFIqfKMTWhGPF
	i8cR5Jog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmLzO-0007gh-0i; Mon, 07 Dec 2020 19:16:02 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmLz3-0007aR-Bh
 for linux-amlogic@lists.infradead.org; Mon, 07 Dec 2020 19:15:42 +0000
Received: by mail-pf1-x444.google.com with SMTP id c12so3949182pfo.10
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Dec 2020 11:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hd/sLpJL9/orp2QRdvfsEwBJETO+NpWkNY62GGj384A=;
 b=lsWZtQ/YzHfWOTN1hNWDoxBL6yb9E7Rpf38w6PvlU3Qykptwa3+OgDqcwO6N2c1LTt
 Fn6qjIljswp3e2Lg3R8XPJTYOXXmt5do8vptgFJBBiwwmiFKY/F9LrfmW8M4iBmQSnte
 aX5iHACjs1T7+ScTRiNTNxmkEvClnALofwKS6/+tP2gzg5zoBntColSoTaapBzMZ7uC6
 Nhdi/t9HLWqKnAJu5deteI/0MQCMX0on1maJoyyFu46rHkTn4pFUz8PXTysiolcNi5ka
 fnQYjPnFVJpYtV6pTkmjEVP2L2KmUpQWwTvT7TYBbsVqB7FpldxA0jn5Ef9lx/rn2x2X
 khTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hd/sLpJL9/orp2QRdvfsEwBJETO+NpWkNY62GGj384A=;
 b=hfPKn1/U/hLxs74kprGrjrPBaFXweVv+gD00iIsypBl5QGv5hE71e+au4i+j3TiDxv
 i2DmR6XnToCE2xbm/gs5ax+Q29eigaHsxUPF7uEFwy0a7YmWb6vtw3TftAZ00aNOQOHW
 YldIjo0DcvkeW5CEDzIJCjcqvcBPCk8ATEcumS+4cfwvsvMQK+OP6V9N/3rRd/5/0Q3x
 Kor0lx5Ige8Q0zi5pmx+BhCgsvmL28ynZdfP9e4/ZzdYXkOgaPW4JzdlOCLC/t4Nlq3Q
 1x4z73KFakUJU0NKjSn66xVRg/09kZPiVsvYX71BgBHENUoRIMxWh9cWhKLtQvNh5tgz
 v8wg==
X-Gm-Message-State: AOAM5300gqCclUjb0HG1Wb8gtdXNGUmxGj03tkK8XaIV3lN/y/EyTcEp
 4UNmKNGzPhoVzt5QfFssSCrLU113/ZA7rPAo
X-Google-Smtp-Source: ABdhPJxeQBH22FZPDq92hf9dbxsnKr13iIoM3ezkzxjDbU3rE/3cWTrKrGp93fsltKkE32NgHnv9/A==
X-Received: by 2002:a17:902:830a:b029:da:df3b:459a with SMTP id
 bd10-20020a170902830ab02900dadf3b459amr12240972plb.75.1607368538498; 
 Mon, 07 Dec 2020 11:15:38 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id f7sm14919307pfe.30.2020.12.07.11.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 11:15:37 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH v4 0/7] arm64: dts: meson: add more GX soundcards
Date: Mon,  7 Dec 2020 11:15:33 -0800
Message-Id: <160736852893.39684.11773180672658935633.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201203060023.9454-1-christianshewitt@gmail.com>
References: <20201203060023.9454-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_141541_407406_39B903A7 
X-CRM114-Status: GOOD (  12.02  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
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

On Thu, 3 Dec 2020 06:00:16 +0000, Christian Hewitt wrote:
> This series adds basic support for LPCM audio over HDMI and S/PDIF
> to GXBB/GXL/GXM devices that I own and have tested with. Audio can
> be extended in the future (some devices have DACs and headphone
> hardware to connect) but this gets the basics working.
> 
> Changes from v3
> - Drop includes tidying in patches 2,3
> - Add Jerome's acks
> 
> [...]

Applied, thanks!

[1/7] arm64: dts: meson: add audio playback to a95x
      commit: ec78dc8964bbc68d76d0e9b132379bc3f22c72a6
[2/7] arm64: dts: meson: add audio playback to khadas-vim
      commit: 4e0649f4957436cbce20ffc26239fdbe19638444
[3/7] arm64: dts: meson: add audio playback to khadas-vim2
      commit: 0157e1a63c7685dfeee4e7cfd22635ebf104f64f
[4/7] arm64: dts: meson: add audio playback to nanopi-k2
      commit: 6a74f78c34e7503e35da724cdc555f26ea8d1cd1
[5/7] arm64: dts: meson: add audio playback to odroid-c2
      commit: ba414bc5484873bb157e63ba8684d59e27feaeb2
[6/7] arm64: dts: meson: add audio playback to wetek-hub
      commit: e0d9e6eead35be9842aae14f424f2d2ab0be0678
[7/7] arm64: dts: meson: add audio playback to wetek-play2
      commit: 5e3ee48ea072a6fd2c46c552d013e047dc54d1c6

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
