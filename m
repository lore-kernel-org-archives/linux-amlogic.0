Return-Path: <SRS0=ykIO=RZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B0E5C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Mar 2019 23:53:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 110602175B
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Mar 2019 23:53:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c6AJnHeo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LRIgFl2E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 110602175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z4CIzfxt5AdowZG2uffohJJ0oMXNA554WGLBAl5LRMI=; b=c6AJnHeo8dVX4o
	OJ2xGNblaq6V7Ia5s/oAMiq1CDPG8d44PJC7MzKt02W/dhMt9sBCOUOQgcHWpgsvIdaDEc1iEeqB6
	cmgIRDaJ7Gu9IRj1+sIY8VgIv14+vG/8Yy8KWSoIwcHsmcIC4Mamg8B+/FVD1c6UlJISl5Drz6HPN
	M/uEDUSdmq9HN07xshRwPb9HOVwvmm+gbcxgORC2j0q7lu6ZfoSpndwlla44+JZTgy+kRlU1T4Ps1
	gBarLCbrTi8jJqNsoQh6OaXciF1BL+aEDbGKI1Oe7do7w77xuoXgCtqYzDaP1Ylnkip1qcXugh4pw
	8ZT34m682K+V8/IozCmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7Tyr-0006tL-8J; Fri, 22 Mar 2019 23:53:45 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7Tyi-0006hH-9J
 for linux-amlogic@lists.infradead.org; Fri, 22 Mar 2019 23:53:38 +0000
Received: by mail-pf1-x442.google.com with SMTP id t21so2559919pfe.2
 for <linux-amlogic@lists.infradead.org>; Fri, 22 Mar 2019 16:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=8MeyfL9P+TzBFKo4h9VhMDlScje41WZzffHv3i9eBuE=;
 b=LRIgFl2Ez/ojrJM1byKWK8Ct2jtgAqzce4cbuXE/NFDtflo64JFlbS54p8RcSX73X5
 2IyPpsaCZxI89O61w0K0joj53H7Aw/wfscd/+V4ZKouOjUyN7+GbiRrSXU8g/yvVgXlT
 kkB6cj6QfzuQDFMJJUHzVrtUJ/Zo1oVzluk85FCKnhg0YzvRi+6oGlPLgPt2Z5ePpyYv
 nFa5f6At8V5sS36qvzLMnkPNi9XyEX+mb60kB6L8DYH7FH5RK0kH7pqpxAfF0AQa8zFZ
 izLrVsdH8naqP7kA/K+TOn83ny2hMYqnChlmnnUCJeTPuYvz+HJ3YAsMiQg31UVxgW9c
 t3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=8MeyfL9P+TzBFKo4h9VhMDlScje41WZzffHv3i9eBuE=;
 b=VgPQnB0FAZKbk6XPPt7qgAFPLypaGuu1xSdBtlyctDy+VgDv8vjaLifrZqM/gQX5iM
 cpiOCKJH0cKjQ+8A5Ws26PjTcbpQ1kVwI1c6InqDPxOhiwSlbB0Up+kB512zHGBj7QYi
 vj9FUqF1VFjkOINx8PjIPfrNLbzQ45XgfGROQSFYCSzDHV2Ojx3CK80Ao+5aUcc2dAEI
 IQs2pzezTSL+g1QvqFr3Vuq9+FopbQNIVbTF+4UPJQGUgTVMxIAYAz/3qcQhWukOkuIB
 BX7sqO9cJCFEeIQ0J4zLfzyxVlPB85p2JdBdY9014Z5BWhROX7rnLyCqXzLut+SAwGwi
 lb5g==
X-Gm-Message-State: APjAAAXfGSVO68XOOxzYAZ20uiiAXsgoxpu4B/xaOViEOiU940vlHKam
 kVixAT7ttZdcp7I+mcEVpiVM1w==
X-Google-Smtp-Source: APXvYqwYT2gMrQkqM3vM84OkzVg5sj2ee78VHyGr7eQxU3ba0PNNCfKtK5/keBYa4Q6ob+lGqV9Kww==
X-Received: by 2002:a65:4384:: with SMTP id m4mr11431713pgp.375.1553298815248; 
 Fri, 22 Mar 2019 16:53:35 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:314c:c810:897b:a1d4])
 by smtp.googlemail.com with ESMTPSA id n82sm16887304pfi.63.2019.03.22.16.53.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 22 Mar 2019 16:53:34 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/1] dt-bindings: clock: meson8b: drop the "ABP" clock
 definition
In-Reply-To: <b7d2edf1-da66-a09f-5f29-28f37ce3f06b@baylibre.com>
References: <20190319214123.27219-1-martin.blumenstingl@googlemail.com>
 <20190319214123.27219-2-martin.blumenstingl@googlemail.com>
 <b7d2edf1-da66-a09f-5f29-28f37ce3f06b@baylibre.com>
Date: Fri, 22 Mar 2019 16:53:33 -0700
Message-ID: <7hmulmzcsi.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_165336_322741_77D3A9B2 
X-CRM114-Status: GOOD (  11.08  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 19/03/2019 22:41, Martin Blumenstingl wrote:
>> Commit 8e1dd17c8b0e3f ("dt-bindings: clock: meson8b: export the CPU post
>> dividers") added a new clock ID "CLKID_ABP" which contains a typo. This
>> was fixed by adding a new (typo-free) #define CLKID_APB in
>> commit 40d08f774c17ad ("dt-bindings: clock: meson8b: add APB clock
>> definition").
>> Now that the new #define is used by the driver we can remove the old
>> one (because the old one is not used anywhere).
>> 
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> ---
>>  include/dt-bindings/clock/meson8b-clkc.h | 1 -
>>  1 file changed, 1 deletion(-)
>> 
>> diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
>> index 8067077a62ca..cd11628f50f8 100644
>> --- a/include/dt-bindings/clock/meson8b-clkc.h
>> +++ b/include/dt-bindings/clock/meson8b-clkc.h
>> @@ -103,7 +103,6 @@
>>  #define CLKID_MPLL1		94
>>  #define CLKID_MPLL2		95
>>  #define CLKID_NAND_CLK		112
>> -#define CLKID_ABP		124
>>  #define CLKID_APB		124
>>  #define CLKID_PERIPH		126
>>  #define CLKID_AXI		128
>> 
>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Neil / Jerome, I'm assuming you will queue this via the clk-meson tree?

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
