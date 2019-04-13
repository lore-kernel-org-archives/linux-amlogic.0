Return-Path: <SRS0=Clcc=SP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3396C10F11
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 11:43:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 887282084D
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 11:43:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s5uCLCnF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="X3w8IXwa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 887282084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EMdI4dXnUDeLLw8z31m/typllHdXuA1Iz7+CEBRlq+M=; b=s5uCLCnFOAKyeg
	+SL21wN18OVqBy5nzsA8rnYJCFi4skGOzjPrZLwkp8QZ4+xWb00XIeKsqDT9v+zXGYtcvLJ3ikcpg
	xqFae5UAKLxDnXxiVLPCU+nICa5LnW3EhzmvY/39wUk174jyfS4VEKq+R/MB9XxDE8sIZkhb+ngZJ
	SNa0TxHnao6HVm0Qm0Kt0Ldv+fJKdGjc+7r17euU8/MwVvDp7TirWLmt1lE5kZB6iJvQ79FfixgXl
	eMtouwYXeht9BT+piX7OGjLzVLjaEX6G/enSfGpQpiUwZ3Q88JUqFcROlncojKU4fdhFDnYF7vFy+
	ofkv3hdhWNx73k2dEhWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFH4A-0002ug-Nq; Sat, 13 Apr 2019 11:43:26 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFH47-0002tv-Om; Sat, 13 Apr 2019 11:43:24 +0000
Received: by mail-oi1-x241.google.com with SMTP id v7so10115273oie.8;
 Sat, 13 Apr 2019 04:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8PhNdP0asdVObS6Xc/5QPUT8gFKo5WEOH+jVFHzdyF0=;
 b=X3w8IXwa+SzR5FfzM9rOMzxd4hw8y+kSdy6o78ko467+SvDzG1kvjZP9lrs1c2Dhnw
 Iv6GYbYxl32ta2f+S90yzujPiPggs4XH2TZLFcaQ6EHV09gN/tJBnYi17bqBIubR2Fzm
 +5OEDDkZuZairFfga1GZpwZaxvULbunu0gtGJMgLDu2DDJidU42NyU92ptmh+z/2HdoN
 f00KlPIpQS8G6NJbL6e1BUihId4CxNNGQMpaEpbrBdAvh/M0g4JcFqM9e1KbD2ipdtpD
 h9j4ZBx19cCWBvyi3/1OW1rCUMALF90fAAuzDWiVwy62ATAgTKHAbUsZ6Y/ThNKqEQCk
 XgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8PhNdP0asdVObS6Xc/5QPUT8gFKo5WEOH+jVFHzdyF0=;
 b=rd6n/xSjHN2TYZg5++KuDrRSvQ6uSmGsDYiw/LPp0qAikVl43M2P3rN1h2OmSeIrPY
 HB5TLwyFaQhOI4BT5nnvD3vmkHeWuY8U6vi8SjXUvu8Oo/wbTaid7YplX2WfmOM/NvAo
 +OChC2YIiMe5cnE2m8WLN2yaV3cBOzfHKXLBy10ZuMUTGKYayfFQ+qTtxsEov5LgaQk6
 N9ziTOqCZH2VDIzoIDF0OfU1FutEgb/wVBZZAKyfcbXduO4OLz9lUbOFfiZbbsPgaJ88
 RJalH8GNtUCI7N4yVwYwGd/rolNSe/hFG0hNSBrmSME6/oAA6g8Y9jjyX7u8Ok2Cjrpf
 DhUg==
X-Gm-Message-State: APjAAAV0Eql8LE+w5Wkumc86WOq7MQjlNZxZCRg5wfXRr8mZtwYigrG7
 uLe0swJDcidKZS1PNf92jXaQ+st63zIM3U9UuVg=
X-Google-Smtp-Source: APXvYqxqXFZDeb3MD3FPgVmZ4ZsFdh+cixd6uEq+e7w+qpemMnK54guuTIMepO8ZQ/3ObliIu7U2Wb6CvLTe+yJydVg=
X-Received: by 2002:aca:d487:: with SMTP id
 l129mr14029433oig.129.1555155802759; 
 Sat, 13 Apr 2019 04:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190412100221.26740-1-glaroque@baylibre.com>
 <20190412100221.26740-3-glaroque@baylibre.com>
In-Reply-To: <20190412100221.26740-3-glaroque@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 13 Apr 2019 13:43:12 +0200
Message-ID: <CAFBinCAhf0EpnvUnYFEvAHo44a7OBoD-Hasx60Aow6ZfvWWEpw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clk: meson-g12a: Add Temperature Sensor clock
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_044323_805137_398B7B77 
X-CRM114-Status: UNSURE (   5.20  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Apr 12, 2019 at 12:03 PM Guillaume La Roque
<glaroque@baylibre.com> wrote:
>
> Add TS clock used by two temperature sensor
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Reviewed-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
