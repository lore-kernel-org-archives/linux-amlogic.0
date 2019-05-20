Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D155C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:31:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41C9A208C3
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:31:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BY/8tjYv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="RwQKQ5Lz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41C9A208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9JAgZHxWfXg4IW1xcfMgUBNra1uUU/HlaRKQ/cCsOrY=; b=BY/8tjYvFW8DKC
	uhceNMLQWDu15b3O4kPymh1ZtZjKeHtIeAs8H2FVTCQN12LBQSvU20JzkARDKvFrGYzJ7lGPndt1K
	PKengF7vA43pQRWajAMjZlheb/WhiLoabPE1WMwJ9cL1BK5O/dH1G+Lxt0xeFYccorBQWTxXH9Q8Y
	nfKImZBUL2vt7u6XtF/YZdFFhahCpmAEvxku4WjuMl1KbrZVQwUe2v8k6HncHKLt54gPhicNjRpDR
	WuSnUOwAQStrtQ6Ab3y9HW8MFfFbJAidKe9HcRocxnR0Q5QWL8HSaBy9bd7r/F6s/hUeynxyPcwKr
	jvAlKU1Xd8QGFU7qE0Fg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSm8c-0005PG-AV; Mon, 20 May 2019 17:31:50 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSm6w-0002B3-LA
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 17:30:49 +0000
Received: by mail-oi1-x241.google.com with SMTP id t187so10592766oie.10
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 10:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w3D3DH3Fu6zPGdy8wXa33dC2jEvuVr+iNnwQmfWSS0A=;
 b=RwQKQ5Lzjd/yuajL0a8TD5eYFALJmVy/l4WPHaAm0uvSnsPctQQgAw6d+FL53P3XO+
 tVH/dmHBr4tWoRSg0D2+O9YID9dkErHYkq+waO0kd16D9M0Rw1Ptd87/76eph2FxXs2Q
 J2nuASsdqC60DP8hC3iA70GusQQ51PrrtW8tJcMteBoZX9KekgZE9gXFRUXv+ods5KUS
 pdxTei3UpwOKry8OecT22OkNIkvN3fV/tvppl6ThiKEy5lPTjgND6MoMQgZk0x4G4GLd
 XajQXeHS3FsHndEwTJ+6xe76ednJEIN4T/23dCy32gNlhrZJ/UOUhodFA2A/BLnDXnft
 yNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w3D3DH3Fu6zPGdy8wXa33dC2jEvuVr+iNnwQmfWSS0A=;
 b=r2fGzuxGnJjW/brbOplbox1GIkq39EX0P9vq5XnR1w1UJ6EYLLGpeGqSKAICNmZa4v
 NBv+xsQWaWGBSP+bBzhsSk1//LuYZyOzTpZPJkQGzBJI0X/xoBYplmH772RM46eQdrUu
 V70sOgZWVAl4BQbSVtYUYamhFqz1lbTsS0XKAykmCCgjSL+SMuCZD6WXW2jF7i24UnK1
 uYh5dFNwSvxcDHUGKYu3naIb8WPLhZFYw9Za5xWporg8AZPTjjAGPXkquMdADLuZkANM
 mtV5iLTxyvyMdDHp57Mda0ospKELGjFv7mlXj6zE+9kuWoudu8dJFF/oFYer8C/bdMVp
 h7aw==
X-Gm-Message-State: APjAAAVFNnieSMfOJpPNMHCheVrqsrIHlKEVrukQzyXv/tQ7kGmbajI9
 zpSVA+YkoGyGc0yfEujcsSdVUitWw7gC2ELsLJc=
X-Google-Smtp-Source: APXvYqyLRbhJiUJnsx/pAcLvvDyXpHCdWvCHHLtXqlVfdYX4QYuiPeY9+IVY0NVqnhXOrfr7IAkrogU21iwbgyH6EcU=
X-Received: by 2002:aca:ed0a:: with SMTP id l10mr216571oih.39.1558373405148;
 Mon, 20 May 2019 10:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190520131401.11804-1-jbrunet@baylibre.com>
 <20190520131401.11804-3-jbrunet@baylibre.com>
In-Reply-To: <20190520131401.11804-3-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 May 2019 19:29:54 +0200
Message-ID: <CAFBinCAGDwqYcTGvj0d2Pvazj406HbB6+_S8fOSPD+AOZy6vzQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: meson: g12a: add ethernet pinctrl
 definitions
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_103007_417841_43BEEC06 
X-CRM114-Status: UNSURE (   6.14  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 20, 2019 at 3:14 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> Add the ethernet pinctrl settings for RMII, RGMII and internal phy leds
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
