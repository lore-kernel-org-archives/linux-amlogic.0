Return-Path: <SRS0=97z3=VA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F39C0650E
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2019 13:00:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D17DC218A3
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2019 13:00:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HJg3pnWC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RVVGw0F7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D17DC218A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SgULgpFLZNsLcR1SRTrIVLcyb9dfPJtSxmq7R1ka0v8=; b=HJg3pnWCS2VU5v
	3vPpEtClVLp6MrSGqws957R910NRj5HUHJ10uEaIk9jQvQxkPbhpplWaDtJENQ8FQfW6iGPliWYiP
	+JBDsVb3IojtzCXmRALR6ZbCqItgPpunMfA02PLxhCL10tz0SF+7qox1XoQIYTzsJ4gaOypj4Vm/+
	kOuqiFvf7iHtgA6cqPQ54QKJlT4ptQwu4P/WqnS1D1FSB65ONUfOAnMh3R+3A21FA6tPm+sDyEcEX
	BynHFBcXhRHIDpFnQ2FCcYBZwKubDrr2C4aJzbuQIZfjFnjooRS+ddcZJizdF1mWi0ydjF9pG+jOW
	i4qh6hE5m02ZxGPsjpkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiers-0005nm-FB; Wed, 03 Jul 2019 13:00:13 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hieh4-0004RX-PW
 for linux-amlogic@lists.infradead.org; Wed, 03 Jul 2019 12:49:05 +0000
Received: by mail-wr1-x429.google.com with SMTP id x4so2657984wrt.6
 for <linux-amlogic@lists.infradead.org>; Wed, 03 Jul 2019 05:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=FuvWmI2Ac2pIZhwnDICxrWfsRIUJnwbmAdcXZhrnIuk=;
 b=RVVGw0F7gOGZQ4TEpiyVQ85EpiJgXCb6jLFkfKamOa6QYuyFWojlAQNggohYTdzr2d
 9q2ep+cHOl6daAeiE6MSXobfTG5aGX49Tvu2IO5enl0jIOe6+Fyc7YPKt62Lp3z//l+t
 5afqY4Jrp15R8g77nUuJE0zNLnB+tFRaJJvPrdtgVU2z1eELcxW59gMb5Oc4lSJZx/bT
 yrhnSvteITwxxjIIy0k5vLmKmkPekYMDBmwxbyS+P7F+r3r29MkFd6jsS4TkM4huPNnH
 M1SHjrbF1o55wajA4Td86/gDNbl3yNNhwWYJOd8Rqh38DRdqqOeBuQVLho6nh0gafS1M
 9Y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=FuvWmI2Ac2pIZhwnDICxrWfsRIUJnwbmAdcXZhrnIuk=;
 b=diV+p7Y4x7tiunkl8wR8FQ3ZLzk3Ogs1EKHVZEyP9iGIdQXq1uVK4DkiXeRFrz4RMe
 Oku1Wsw13Xv8ET7lINNACSQIFAdctH1obQnrQtH9fLmoD2rnR9gNATYQb6NMDODEQmAA
 idDATgce0+oTvunyuPMXK6T/7qdAulGkhjh2r1fNTkiZEQ06PLkfPH9z+Jn5rkwZ504T
 TtqP1Ka9KbNP+WhrF2Yv5fIXwJISP13qU1c/0ljjTJA3MNo9xupMR7aZbbYHBI7a2Kl5
 eKFFCQms7Ru6aLjw22R0b0A2w2yp3Jl6ODCDWzJxhqwzEsTwJoWvBzuPOYj4FxzNgOWJ
 MNTw==
X-Gm-Message-State: APjAAAXHV4c7Ah3fu99HoKAR1ZKlqAuHWnuA/S51PqHapTbJi2jcYa+v
 ZNqe/IcdxCTyCLmq2u6F+fXTHA==
X-Google-Smtp-Source: APXvYqyDAfOGOAjcImm7vz1haXRMsa83iykN2nsIK77a4bhegzF3S2j2rg4Wk9JFZ82wUNU8F7il6Q==
X-Received: by 2002:adf:b64b:: with SMTP id i11mr29086502wre.205.1562158140924; 
 Wed, 03 Jul 2019 05:49:00 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q1sm1504594wmq.25.2019.07.03.05.49.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 05:49:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFC/RFT v3 09/14] arm64: dts: move common G12A & G12B modes to
 meson-g12-common.dtsi
In-Reply-To: <e49bfb8f-23e9-c834-62c7-a40528a2ef06@baylibre.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com>
 <20190701091258.3870-10-narmstrong@baylibre.com>
 <CAFBinCA537EV9kzz+5syaF1Q-stTJ4no+NBdcYD3QL-FJSoWfQ@mail.gmail.com>
 <e49bfb8f-23e9-c834-62c7-a40528a2ef06@baylibre.com>
Date: Wed, 03 Jul 2019 14:48:59 +0200
Message-ID: <1jlfxf7078.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190703_054902_968426_C7AA2B05 
X-CRM114-Status: UNSURE (   7.17  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed 03 Jul 2019 at 13:51, Neil Armstrong <narmstrong@baylibre.com> wrote:

> On 03/07/2019 01:54, Martin Blumenstingl wrote:
>> Hi Neil,
>> 
[...]
>> does it make sense to name this file "meson-g12a-g12b-sm1-common.dtsi" instead?
>> do you know whether there will be a successor to G12B and what it's
>> code-name will be?
>
> meson-g12a-g12b-sm1-common seems a bit long to me...

+1 ... and what if the generation after that is compatible as well ? We
extend the name again ? Such naming scheme does not scale.

meson-g12-common.dtsi looks good to me. IMO, The fact the sm1 dtsi includes
the file is enough to understand that sm1 derive from the g12a/b

>
> We don't have naming of the future SoCs, since SM1 is only available on
> prototypes yet.
>
> Neil
>
>> 
>> 
>> Martin
>> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
