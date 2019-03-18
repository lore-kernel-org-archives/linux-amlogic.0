Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED25C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 20:13:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8972F20828
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 20:13:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hi0XlFzY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="mAKFJFqi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8972F20828
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/q80UskR327JbnnDL8NbPumy0IPsDZtcssZO++y6es=; b=hi0XlFzYDYiN8O
	B7h33rh6OtoPKeFNEZcS6aU67KpN9F/kcDQ3gfnfRGXPgfVigtaPh1VOe0NrNzGIIaL4yw/UBBDSO
	BKa6A67xT3/xaYcTuclcbJR0+3R5G26s9J4c4PBWmhNLpCg/d1cxV8lxjk9vOflLBBQ61jUIKS2V4
	fEu6b5RPxHRryRBtgLFJcww4OuwQtifRdM+7Z48E70fc7BZYyUnGCBH2m6rKsiyP46lR8xNwLZAYW
	+gZ9UN/Yd9tz8iwf+PY196w6wp/AcBkg4AwEs0GFHFVPTstnBiUIFWWlVaffXHTYdE2P5vB3TL3TW
	gJunWNORxngVG4uL2QCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5ydv-0003vu-GM; Mon, 18 Mar 2019 20:13:55 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5yds-0003vO-HR; Mon, 18 Mar 2019 20:13:53 +0000
Received: by mail-ot1-x344.google.com with SMTP id h7so7672389otm.2;
 Mon, 18 Mar 2019 13:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ley2nh3GFrfpOpGk4n030KPLgXgEmt/2h5lDf9s9dEA=;
 b=mAKFJFqiDQc+2hXNhQknOvDGq/lAvfTgO/Cv1Rcjlkeu0J4FjsyYMe8yHw8gA8NhTu
 5eqjN7en5Fbh7jAv0DM7ACjhxH3W+/VrJToVd9Vckyykk3SlvrpJbuomNKTnaXJjIY6e
 Z9r8nOwJ7xLWg90QT85pHCMBUXXs2jYMm727cfN+KV5YmMcK9l/v09GMO/z1Wg03B6Ve
 0E+vC+25J9IsXZmDu5izvIbfaUrU9+tf4dmBEBosVN32wdXzUmUQ0zZzk9nn0MWz45n2
 9IisliRQp8IOdwjcmdoBG9oGTPUHxj5tW9GIkGV5JCAEZ4c/+LIJR8DZ0FNenTDVGE5V
 wc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ley2nh3GFrfpOpGk4n030KPLgXgEmt/2h5lDf9s9dEA=;
 b=FmxiJRaosBBh3Ep6qEVNYzxZom4Ws3NyxqoAEUZLsC7zQ/+eHHgDB9A8xjnf/KlpIB
 xhsdHwV47k3U/wCFDiAUyuooSlR6TifaN0t4heX30di5VHGmCi9TjzYkPUiNLx+8UGdr
 TiypDjTp6SgpQzrUzc5UdJLrrLNvo02oB8ex/egj3KIZwIfvYwTPLJF05+WsbpSJBBrj
 i+jqLkpofqVW3ph4qC9kVqM21/mIFvFa0kOc0/1pr7XBBV2ICOE6ZZjO38BuRnhOWxLw
 nBg/AHj6U3c+9kIW86VXWl+KINPHgwfFi/jVqGGbY+JkgyGjx95tP3rE1du1hp4O7+5O
 S/Uw==
X-Gm-Message-State: APjAAAVTvpFfam2ilTbyTpjPWBnv0t1m82gdm3KOSFWyWO4yF6RDUZ2i
 SlQjbzK5xBuY1l65DN5I/dSUD+F54TnhEulj1hqxpmO6
X-Google-Smtp-Source: APXvYqyIJ/fJ5Ryl95uXVYFDfnRiMR7/LOMVdYNZaZZYH6o5h3HY63Tkwz9uvRiWvUKtKlVKSQB0Iw3FmweksseRz+Q=
X-Received: by 2002:a9d:7441:: with SMTP id p1mr12227529otk.148.1552940031770; 
 Mon, 18 Mar 2019 13:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190318100458.5619-1-narmstrong@baylibre.com>
 <20190318100458.5619-12-narmstrong@baylibre.com>
In-Reply-To: <20190318100458.5619-12-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 18 Mar 2019 21:13:40 +0100
Message-ID: <CAFBinCC_+KWZW0p-HGRzjsYZGHN_FkU9DicR6Z4+J3KfzPKbUw@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] arm64: dts: meson-g12a-x96-max: Enable USB
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_131352_573249_F0763F9F 
X-CRM114-Status: UNSURE (   7.06  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Mar 18, 2019 at 11:07 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Enable the USB2 and USB3 Host ports on the X96 Max Set-Top-Box.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
