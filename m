Return-Path: <SRS0=5fWL=4J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6EC1C35647
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 10:47:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F9C02073A
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 10:47:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s+HPFZ3C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RGDqo7t7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F9C02073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IljcUo3jTdx8lXeUEAewOE9B2VFflvyqfz3clPFo1NA=; b=s+HPFZ3CR46DW+s9ChWWxIGX4k
	yRN0LhemYVouy9L2/haNt0ZFOkUOz+qPNaqRkrocGF1lsH+hSOcWvSz/X1RpWTfuRVQvRkobWIj0T
	yOzgkc9lXOq6MRzojtCNOSagP+Kh5AFNqOwvwNIgRls+1UKhjHmK0OvLxXjypXUtaAbNaQ1//jQ6a
	U7AkkhGdJF9cLi0d49QcNn5p+wwWn6hRIvmqBFZ1iT7iHATfupTnX1yWFAFHKbEohjKWCSnZBGJ9X
	Kz9lty0inhnUy3y8kwyI5Mr/bJWdh2cfBUO5/K5HNeg8n/srmly/S5htg4eQDAplxEUb3T2LDibGq
	H4N7YiFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j55pv-0002Ut-C2; Fri, 21 Feb 2020 10:47:11 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j55pl-0002LB-48
 for linux-amlogic@lists.infradead.org; Fri, 21 Feb 2020 10:47:02 +0000
Received: by mail-wr1-x443.google.com with SMTP id u6so1488524wrt.0
 for <linux-amlogic@lists.infradead.org>; Fri, 21 Feb 2020 02:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=f7yu7K3JlqyMe87m1GSh91P+I8Cu0Gpj7XsTeWNuw/0=;
 b=RGDqo7t7PQPwtANjW5Ko22b90oJlbS9Mbf6ViJpbXRNCF7YDRSRfcvNmdV/zT3QepT
 HThU/ZP44u6O6LrZKKLyVd+22OjfZ3zbVn9pls+kj3owR3PMIQhitrXFftNz3SitokNR
 T9mPMwW3fNVmP5iOQ7p/HA3l3Lb9CdcHBngtcXO3U2oV+r0IdSKHXiUM1sOKePr8qnea
 qM00U+ZEW0OciRHwoyROaCyh+gPx7YMiHu61+a2gOcvloFrncIu++N35yGAmyMzsdyPd
 AJlP1Ycpd3nkKQbMNXSKVsxgYoPo4JjmEbtslNFQNYDgbTxTqTyI+1Cf0wwACm5gt6AC
 arcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=f7yu7K3JlqyMe87m1GSh91P+I8Cu0Gpj7XsTeWNuw/0=;
 b=f0ZEl+4eS5fHmFP56sDo1xHIu0e5Qqc3j74gnw+jdON2Wl3HHYwlBznRm/sEDUvnHb
 f12+jXqavdel3sDyZGY3GKbxF6SJQrt0+rf7AdxvXErbRxv4/wRqj/tNEaESXpRhdL4a
 rd79RvVKlNxBl3hwKLaTGKAMTs0Mwa/TSWhkl2Gen1amG4C5XXDzVlCs7VRgQAw9uYn+
 O0HG/2AMI8J6n4GDec21B/+YGJVIH5hn5qCTbd267Gl/IwXi8r1VNJk/Pln90Phy3Qd/
 OtiRdRJLyKoH9f/omrDAl8OPy0knzB4q4TwslZBhy6ljW1YB1Dblfq29TcS4yKEmgcj8
 hNZA==
X-Gm-Message-State: APjAAAWoKu1XmbywYuOMPM3GRNgqG+6v+lkl/9cZrkk0GIjbfjqZcFJe
 LWtyUgjmagRx1rv/Nb5qU0Vbqw==
X-Google-Smtp-Source: APXvYqwsELLBhCREi3H11GBspa/fR2fMvBqx3YW0qemlsSfDpaHyhrVRZwlk5hC2zFPbUNrDKhRDaQ==
X-Received: by 2002:adf:f28f:: with SMTP id k15mr47355503wro.230.1582282018874; 
 Fri, 21 Feb 2020 02:46:58 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q1sm3376647wrw.5.2020.02.21.02.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 02:46:58 -0800 (PST)
References: <20200220204433.67113-1-martin.blumenstingl@googlemail.com>
 <74a8613c-ba30-5f42-9edd-b5af1d7f330c@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] clk: meson: meson8b: set audio output clock hierarchy
In-reply-to: <74a8613c-ba30-5f42-9edd-b5af1d7f330c@baylibre.com>
Date: Fri, 21 Feb 2020 11:46:57 +0100
Message-ID: <1jpne82p5q.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_024701_163162_D5BA0E58 
X-CRM114-Status: UNSURE (   4.89  )
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 21 Feb 2020 at 09:28, Neil Armstrong <narmstrong@baylibre.com> wrote:

> On 20/02/2020 21:44, Martin Blumenstingl wrote:
>> The aiu devices peripheral clocks needs the aiu and aiu_glue clocks to
>> operate. Reflect this hierarchy in the clock tree.
>> 
>> Fixes: e31a1900c1ff73 ("meson: clk: Add support for clock gates")
>> Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied, Thx !

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
