Return-Path: <SRS0=Clcc=SP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1CDC282CE
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 11:37:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08D3620869
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 11:37:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KazQYau0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Fz1+CEGn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08D3620869
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g8jRDT+z29IlHJWVHch5e7uqTHqeHkNtwZMGQKzZ6s0=; b=KazQYau0yRsqy1
	FPFODbdUFLKV9silMsgXSbymnsPsKFq5BOsbCEwPW2QdrXbsy7BSBZ2wo9pp/TIORvXva/nOLHijx
	p9dfBOElYVvR1tdCKxU4CP458E10EY6DOuxODeCatqwM2OL1lChiYWbMxTbeaViG89Dwkf71+Gbpx
	J61Ib9dmUc8/ihSGYwSSt/5OqlZDBaLIt4nCeOpK9r3GlItz2Uztd8N6lOHp87N6r45bqgLNZATBG
	JDBsFROv7LTewvuFjpJoZRsH/QRa/g+uKhztxdr4q2pfO/dA5E3JwKnLXYob1RWwSXoERwZy7T42u
	7CL88ZLBFpGyz1Swl0zQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFGyU-0000mi-GB; Sat, 13 Apr 2019 11:37:34 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFGyR-0000mH-7f; Sat, 13 Apr 2019 11:37:32 +0000
Received: by mail-ot1-x342.google.com with SMTP id c16so10665289otn.4;
 Sat, 13 Apr 2019 04:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cPr5fJiz4nXGuDrFwW8vntfct74jRoGWcNEctADPJjc=;
 b=Fz1+CEGnRVkcD4QngclFGONsO1Wixzn9nYeHtcDbKPw2nyfUQVOO4b9PsZaHKclgdy
 ZQ19b/6A1HohZ/2Xi8ch0rlAV9VYB3c3SJA/ApdjxA2Az/V4/5swtRzTG6h/ICD1RCNU
 Yn2whrjmth8wNfgyGUaRs/N02gHf0UDeDQ3Na63+Q7Zdm4DvCAA4zg0KQJLGT8V/TwZE
 8y9OCv8r1qNA9LLNrLfqlpYMRID00z9it126zQmFN983nPb4TY0MMIYfdY+mp/8RnU6D
 Lsr2UNxdUiPN4j+rOr69rfEsIvWoJTRJKPmvi9uJCXxa+ogKt0MD4fbb+vu/LDQcupVO
 ICsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cPr5fJiz4nXGuDrFwW8vntfct74jRoGWcNEctADPJjc=;
 b=rojNAZPqfPjPgOYCAYshJ56K9lOwGCEAn5oJktzj4iAwcbdo3XgPeLxayQ9AQEom51
 Ef92zj9QicPQave/RBsFVopuVGZy0pq0aBG7JzaAViTQUO4OPo3SuqZeuZr1f9hp6vZh
 koX+xIGfVLz8Fbjhoodo6UbX1dkcEnSVmJSzsAESpedjRt0VqW15t/cEO4P+IPjHH/eF
 FMFRHMug8LLUCGiOXokQSZze0xJgU80cWZt+pmxwbf24hrEoUKNXhCyPRATlraBruXLG
 fgsIay3P4prn9yNyf7elDeDCMCw1t3Q3IcVaARi5VjnYIGAmV3U695T/BGPakk7KKnqB
 D8Cg==
X-Gm-Message-State: APjAAAXjv9gOtNHp3R31CWLYGXT7XlDL9hrI4X+GStU3tdL/UX8oPZqy
 c41kshpms6AtmDmwnSPifqNqU84+kbm6wQJvVaw=
X-Google-Smtp-Source: APXvYqxzGCfIyrIAv+u7k39uAGKbvbJJ4MpMp4GSs+6yxhCpJZVFMuXbhKBUhNys6IzPlNuSIUUdYS7bk7oPI+CyD/A=
X-Received: by 2002:a9d:6e88:: with SMTP id a8mr4225415otr.117.1555155450171; 
 Sat, 13 Apr 2019 04:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190412092337.6941-1-narmstrong@baylibre.com>
 <20190412092337.6941-4-narmstrong@baylibre.com>
In-Reply-To: <20190412092337.6941-4-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 13 Apr 2019 13:37:19 +0200
Message-ID: <CAFBinCDRFCo6GiTQ+zArqeuZCYK6BdfMVtRDUAhjG+oLEZyA8w@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: meson-g12a: Add PWM nodes
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_043731_282433_45437F7E 
X-CRM114-Status: UNSURE (   8.12  )
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
Cc: linux-pwm@vger.kernel.org, baylibre-upstreaming@groups.io,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Apr 12, 2019 at 11:24 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This adds the EE and AO PWM nodes and the possible pinctrl settings.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
I reviewed the controller definitions and picked three pinctrl nodes -
all of them are fine:
Reviewed-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>

that said, I had two questions regarding the AO PWM controllers in
PATCH 2/3 of this series which should be considered before applying
this patch

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
