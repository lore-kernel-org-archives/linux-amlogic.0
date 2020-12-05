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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7520C4361A
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 13:14:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 796F62310D
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 13:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 796F62310D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ha4ueQVSfIOQ9g+OltKVyVyFok/OmrMEws3oS74Dk/k=; b=hvdnkIs5MmCCWXao1Y4hshoQy
	grU9Aqd4dIeTOAFZ/8bzEZx+wqKQfWZYO5Gn3GQrCgGt0mT/jUZvTrGAqPib0Q8/rb7T7qn7pjJbl
	nFzM9jmSVTCWwJKsT07UY15ri4o32q4qEl5t0hk+LCbJZ0uiz+sTj2+Jz48OgpW9bmx+MUlIvxAPN
	fGpx1ctkIx7GkI/rRBGt8j2ev3PHBtMoYCCPUDGfoYbGGboJRvzPasEb2mFyoYAHx5WpNFWOAXqKh
	LiciPxLMotsECu4K+fo6HXbuFjCFo5b6xiA/AtxqF4Q8VdcpjwvrAQziolRwOn5tIY8bxR0ccS3+3
	8Gpd873CA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klXOP-0005jp-FQ; Sat, 05 Dec 2020 13:14:29 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klXOL-0005jF-8E; Sat, 05 Dec 2020 13:14:26 +0000
Received: by mail-ed1-x544.google.com with SMTP id k4so8810470edl.0;
 Sat, 05 Dec 2020 05:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PSWuLaWp7kbS1P3O0848/H0adnOKzlmdgp1RQ+ybx9E=;
 b=DfuNWu0nvI/vVGwzISzLSSGehEluoo+f6F2w8cnNEFZ6a5Yg2UrKW+I9A+SOR4/Y9R
 12c1zdDfc88FUXJ67ZddR7xaLyOd5DnO9WKZYsgYatjFSXOY7moPGweTQCCC7p80LKyc
 UL+ri58kmYox4rh31GYuaGdK7VI0dfTzYbM09MSxZf4YRJ2wlrzXi/e6bmt2IpQ4zy75
 X8oOVyrKZkkYE7JVDH39hOY8EZt21JZT8E7i//I1ME5t6VPD6EyHXZ0EIYo3X7YzG3V5
 ol/hHsJ/T9Jen4j89EYlphWclFthOV+h4p65gd0BgAiuDi6Mis8/o3fhJeqyecOtS966
 G5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PSWuLaWp7kbS1P3O0848/H0adnOKzlmdgp1RQ+ybx9E=;
 b=AuCghBqLiDAObvPEwc8w8WcaSx6IHxNWjQhzgTSYVDBrSrzL19y5s2aia6w7/pumpb
 KCQqx6VJZ0jb22TT/iYK3RAqUQgESeSZHCukgWfzSP+mexdw6vkKswh2pu9LOkUnm1JF
 RZkO9L49GbOlaRmGFZ1lTaVwaV+5XjpFr6upcEHXB91J3Az6HN2iYd1KzcTsLVOaRuYh
 5uMMug5sNAiV+UynCmZ7WJ7ldfyuWd6BSNfIHg0uG47YBA2Wlx9l+zmM1Zb/FVUmYrdt
 fv0pVo0QPJ79czx8HS00UYpFJorlRPwzA9z0BzK7xdYrnewikHA3ZSNW6C91YHK15Wc+
 e5Tw==
X-Gm-Message-State: AOAM532CmYUZwcjMH8zwBLQsZDgRT42jqDDik/IalXaxi31BLww0uLkh
 pgJfO4nOYaHhrDGau9vfPvcJehFGRbn4eyMJta0=
X-Google-Smtp-Source: ABdhPJzRPCNK8jPVIDmwevaTpwC/Fk3APx2o2HatJoY6Xlb9UvfG2YB3rpdT+mX5GocDIz0W4p7xxZX31yeO4wv3RmI=
X-Received: by 2002:a50:fd18:: with SMTP id i24mr12318534eds.146.1607174062920; 
 Sat, 05 Dec 2020 05:14:22 -0800 (PST)
MIME-Version: 1.0
References: <14754fd95378b78eb9a0a3f8b6bab13f7263c7f1.1606828668.git.stefan@agner.ch>
In-Reply-To: <14754fd95378b78eb9a0a3f8b6bab13f7263c7f1.1606828668.git.stefan@agner.ch>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 5 Dec 2020 14:14:12 +0100
Message-ID: <CAFBinCCBQupdpm0CmxZo_VeRyk_Kqwqsf+Q66aaxqcNv3hsA9g@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] arm64: dts: meson: g12b: odroid-n2: fix PHY
 deassert timing requirements
To: Stefan Agner <stefan@agner.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_081425_453671_F33B88AA 
X-CRM114-Status: UNSURE (   9.82  )
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
> egisters. This fixes an issue where the Ethernet link doesn't come up
> when using ip link set down/up:
>   [   29.360965] meson8b-dwmac ff3f0000.ethernet eth0: Link is Down
>   [   34.569012] meson8b-dwmac ff3f0000.ethernet eth0: PHY [0.0:00] driver [RTL8211F Gigabit Ethernet] (irq=31)
>   [   34.676732] meson8b-dwmac ff3f0000.ethernet: Failed to reset the dma
>   [   34.678874] meson8b-dwmac ff3f0000.ethernet eth0: stmmac_hw_setup: DMA engine initialization failed
>   [   34.687850] meson8b-dwmac ff3f0000.ethernet eth0: stmmac_open: Hw setup failed
>
> Fixes: 658e4129bb81 ("arm64: dts: meson: g12b: odroid-n2: add the Ethernet PHY reset line")
> Signed-off-by: Stefan Agner <stefan@agner.ch>
with the "registers" typo above fixed:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
