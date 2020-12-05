Return-Path: <SRS0=t4U2=FJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16274C4361A
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 13:14:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B602B2310F
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 13:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B602B2310F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JqrRN/yoq+oBOnyD7aqFFLQG+x+jDa+KUCTPEYRmv+0=; b=L91OFlFLPOXuDhtDUFs6bNZRB
	5yQDp8cVBECM6km1nvvjcQc8ypEEFe6kuWMByQTll1WlfnYPX1l0h33UyR8ta9nlRAPSrEbjbIEaM
	l8enJdt+a0qLjVhSOV91NI7/QBcmGLD9qwbSgEKy7lY9sZe4tZqPqaLjfp1QaAoVvO+4X573E9CDH
	vqqGTkbu6DUWH+9x7C+f2mgtthWj+ysNg4RIdcyzKFDjfYgAowxxBFkyeetubDuiiXsdqtDqFnl6N
	mCyFWV4eYsX/rCB4QlJBQRBrcPPgcmuqraq7Pj5sOfnFnv3Hs/CmV+wRcLvImkcRZzCbQUovVyOoq
	YsfE4bv7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klXOf-0005m4-2R; Sat, 05 Dec 2020 13:14:45 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klXOb-0005l9-Os; Sat, 05 Dec 2020 13:14:42 +0000
Received: by mail-ed1-x542.google.com with SMTP id d18so8761413edt.7;
 Sat, 05 Dec 2020 05:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YOdygsnRTcmY5yyVYCdXMa08JVvP1+QIC39sK4BshGQ=;
 b=RiNPDmiwqdFc1DJHL8RCiXpBzhQxZt5gZVftzubtM7mE+TLT3+b20CfiR2Jh6TBsMX
 dXvqnnKrJWni8XXN4dl0ALFQ1fS0PRwKJkR3lSbOVt6qLQDGEZ2YAWrUzf6bBnMuEm7n
 y5j4xWQk/bAECDd+Pl1Y+hX+MGmhdk04KaVgKUWqcsmzzDJuUcqyvxd+ThQ1GBwkRa2+
 JpmggYQqfbpNXmL+sXYYq4llUtqDS82UeKlnU+3SmPCg901NRkuCjO8MtE2dAMAJ6hf1
 kpgiRmJWgR3yjJj6uZ570VCz/DsdrpsLWkc8d2tYTU5h1Z8aLdd89xHxhNy5QDg6vgVC
 FEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YOdygsnRTcmY5yyVYCdXMa08JVvP1+QIC39sK4BshGQ=;
 b=WjbSKeZGV1RJ+vkClYnMqNwncgATOcmLoMk0kMCphyxkF5zeEh8jYPwpQxdpL4WEIY
 /VsvikW5b2s7v0ryR9BOURd48tPIj0YxhaFfA6EBrC928ZMsDOxc16n/i/BbNYq6/oqq
 fO3fDdX5sKyXSvaaSQMmjFL6S49KwvaL80CFWp3DvqVBqfHyxcD539pXEzZH24+T1vF3
 rLhHEsDDtMuFHZY/w9JzncceoRp9I3VkN/o4E9YJy+StljSeUZHTZtSGhgOXaPf4UqrE
 Dlc8IuwPmALYY8B7Sb/FhTET9ad+lA6a5iE6+4oIniO6u5Hg0qJmn8SfyVJHQ1cH+JRW
 oosg==
X-Gm-Message-State: AOAM532NrHkT0viZVcPjchF+dIGqKbVToYfUaMGxWLk8Zy2l0pF678/R
 9MBA1yMcQqOWO33gfVlcdKDh/8DiWchLxod6A3Y=
X-Google-Smtp-Source: ABdhPJxkHWS2MXLkIwjQevBOf3omAxxvSE/4W/+chTvVrdnb3br9RamrvE8OxnoDaFv0wrveP2r+4sEjjYeg3Fuo2kY=
X-Received: by 2002:a05:6402:2059:: with SMTP id
 bc25mr12126364edb.13.1607174080529; 
 Sat, 05 Dec 2020 05:14:40 -0800 (PST)
MIME-Version: 1.0
References: <14754fd95378b78eb9a0a3f8b6bab13f7263c7f1.1606828668.git.stefan@agner.ch>
 <fe0fb54d4c7b99fb148954c1c9a8b1902c2b7b9c.1606828668.git.stefan@agner.ch>
In-Reply-To: <fe0fb54d4c7b99fb148954c1c9a8b1902c2b7b9c.1606828668.git.stefan@agner.ch>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 5 Dec 2020 14:14:29 +0100
Message-ID: <CAFBinCAMFZDRBekFW_+BRaCgAX7ofyFR0Vu74Kj16h4=KR78XA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: meson: fix PHY deassert timing
 requirements
To: Stefan Agner <stefan@agner.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_081441_824448_6C1A3E78 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, christianshewitt@gmail.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, jian.hu@amlogic.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Dec 1, 2020 at 2:21 PM Stefan Agner <stefan@agner.ch> wrote:
>
> According to the datasheet (Rev. 1.9) the RTL8211F requires at least
> 72ms "for internal circuits settling time" before accessing the PHY
> egisters. This fixes an issue seen on ODROID-C2 where the Ethernet
> link doesn't come up when using ip link set down/up:
>   [ 6630.714855] meson8b-dwmac c9410000.ethernet eth0: Link is Down
>   [ 6630.785775] meson8b-dwmac c9410000.ethernet eth0: PHY [stmmac-0:00] driver [RTL8211F Gigabit Ethernet] (irq=36)
>   [ 6630.893071] meson8b-dwmac c9410000.ethernet: Failed to reset the dma
>   [ 6630.893800] meson8b-dwmac c9410000.ethernet eth0: stmmac_hw_setup: DMA engine initialization failed
>   [ 6630.902835] meson8b-dwmac c9410000.ethernet eth0: stmmac_open: Hw setup failed
>
> Fixes: f29cabf240ed ("arm64: dts: meson: use the generic Ethernet PHY reset GPIO bindings")
> Signed-off-by: Stefan Agner <stefan@agner.ch>
with the "registers" typo above fixed:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
