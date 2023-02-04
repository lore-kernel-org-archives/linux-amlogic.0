Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5297DC636CC
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Feb 2023 22:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S0iX7O2azL8G20WIZQuH7RyZvIS4+qEL97p73Eat/VI=; b=KvDuBhD797kzj4
	ZMxSAk4BNAo432m5B8Ifhc1nnwjLWEYgqFFDFZ55B/AK9RvOdmQgNormX145ZK46MJAtgSSXQ+A9Q
	cLseBzUYmBcsmSZHE4DqdTudJCOzZNOS6gWGzmxPYt0K7oNceYsSErBfmnV+ArOd0xsJBjkS4IUpQ
	gRRjLHL/2/FNaGO0lnSl8jt6EKKeBOBhadmKufErruckWPq74pRSP216hPHVjmw42pJtI3Hk7y5Sj
	QXK9AwMtQxm1pw54Noy1/V3n/wwCeEmgKQlNC/CI3mmNhuf1rPjmEL11+bNnfquu+WEcFrDESpPgF
	0OQ1p6Ganzjg/zG3JkBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOQqj-005cfL-1p; Sat, 04 Feb 2023 22:17:33 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOQqY-005ceZ-0d; Sat, 04 Feb 2023 22:17:23 +0000
Received: by mail-ed1-x535.google.com with SMTP id x7so8387158edr.0;
        Sat, 04 Feb 2023 14:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F0IsnY434H1bb3KX3be4w9cXTO2TYiUaYL3dbmJeKJk=;
        b=T0c5YXFvRx1vpTqoJwrX+lOIoz8r3T+6uV5igAhMjirHyYWnj8bcP0JNd1rbwtaXpp
         BNNiK6w0fzk6KwqlhBuvpkunHxhggCTxtYRQbFmTNpCWUmAOQKYfZMBg7Fg7HKP/byX7
         B1IQG+5S5QDZBCGJzMgvkAirxTuUmVcrHtuHmrntpjltDNSxSoIAtuw8TidGE45bvxh7
         ld2UVA/mT3taVXnd+QV1OQAtzQdX6is1TRLteW6MIZ815HMAfKjKbRNbWlLaQYrSvOOb
         8/FsHHE0UDj6nSPP1T+SG5bJwWupAMTIbmtkBT2P6TPVbijK6Lhu0yOGdO5yYtGw0KTb
         clpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0IsnY434H1bb3KX3be4w9cXTO2TYiUaYL3dbmJeKJk=;
        b=MICoFWU010hDe+YLj3mMs/gxAwX2wzFVVCb0rE4ywP8+rBjhP2Oy+gMJdJElyonESv
         Sy8tdApQO3hmVZvWklugRiZSsCSig6kjn+Fjv0S3KF8ctk1z/Z4JodgntvN2CLyl5ZM1
         yLtSL1EWqlX6iuJAe/P0HSpHvEjB32gnkV7q1fhDLBvczXtQqt8FaeU5Y1erkrjMjkOZ
         hwEEAZefSj0pm3rhLa+E/sSfRNcqnl+upV9RezxycOQ0exu7xLuFNKU4YLd0fgYKx5aF
         isPtjEUMUIKol53stRm3bLzb+SCvza2fAzsDSfQaLhDMsmpNZnUmEXMFVwFtCMtnU7kc
         yffg==
X-Gm-Message-State: AO0yUKXjxhlCKIt219Lct1aMJ/Le1jJW5ql3bJkYnPM5UikZCQfc6BkN
	vhu9jfqPq92hhMQLm5rVOMOZBi7wQUpvXkWNBYo=
X-Google-Smtp-Source: AK7set/X/SXpCdNhJkSTiGbv3L6emI554Lhew5OuuV0if7GwWNeDdkzLG0WHhMzb2Oixg/MUcLZ2w3IGdCuHJmbe8q8=
X-Received: by 2002:a05:6402:1110:b0:48e:b978:cf63 with SMTP id
 u16-20020a056402111000b0048eb978cf63mr3865673edv.57.1675549038982; Sat, 04
 Feb 2023 14:17:18 -0800 (PST)
MIME-Version: 1.0
References: <d9721029-780e-09f1-0207-72d3897032a4@gmail.com>
In-Reply-To: <d9721029-780e-09f1-0207-72d3897032a4@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 4 Feb 2023 23:17:08 +0100
Message-ID: <CAFBinCAuKT3Sv-MhaWnm2aoDJLOWy2OGGm4brp3RhOaP11uzsw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: Make mmc host controller
 interrupts level-sensitive
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_141722_141728_3E67712A 
X-CRM114-Status: GOOD (  10.38  )
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

On Thu, Jan 26, 2023 at 3:03 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> The usage of edge-triggered interrupts lead to lost interrupts under load,
> see [0]. This was confirmed to be fixed by using level-triggered
> interrupts.
> The report was about SDIO. However, as the host controller is the same
> for SD and MMC, apply the change to all mmc controller instances.
>
> [0] https://www.spinics.net/lists/linux-mmc/msg73991.html
>
> Fixes: 1499218c80c9 ("arm64: dts: move common G12A & G12B modes to meson-g12-common.dtsi")
> Reported-by: Peter Suti <peter.suti@streamunlimited.com>
> Tested-by: Peter Suti <peter.suti@streamunlimited.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thanks Heiner!
This fixes the rtw88 SDIO wifi card for me on my SM1 SoC based X96 Air
(Gbit variant) after commit 066ecde6d826 ("mmc: meson-gx: add SDIO
interrupt support")


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
