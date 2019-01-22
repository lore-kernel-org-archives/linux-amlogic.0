Return-Path: <SRS0=xxvR=P6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC1EC282C3
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jan 2019 08:48:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E27992084C
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jan 2019 08:48:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lUZYkqh+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="uM6MvBg2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E27992084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HF3WV2BwIKiVYuZwndVZM7OiRydJydILnm+AzDDMEPk=; b=lUZYkqh+foma6H6pZEMKFlxoW
	Ie7wvpa+4VY5J5K1DbyEhLH9hXfq2n1NZQDj9PlI0Soww2+vO8quZHXdzuhCZZaLgPdq7d8kBb7g9
	ztKiUctHXxZLV057CH/wnc0pC87rz+pg3foiMt/gjyYBr/t/TqJeZfb7c8gNhPTfOL+8ua8354JBa
	Q59Hf7e4DOfykuCU3HlDykYdDIu6clQTzxX0H1L0X3XdZDg9whOq6dNzz2z6Hb64G0n5D6sklf4vr
	+dxvWIWmed3+PIW4+LbIRymf+f6VLXT8hnHGYm3utu0gqIwJt7xTJEzSjF9ildp+5fBY64rgzH1LJ
	o4ztIINXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glriw-0007ET-Fi; Tue, 22 Jan 2019 08:47:58 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glrir-0007D1-1w
 for linux-amlogic@lists.infradead.org; Tue, 22 Jan 2019 08:47:56 +0000
Received: by mail-wm1-x341.google.com with SMTP id f188so13222131wmf.5
 for <linux-amlogic@lists.infradead.org>; Tue, 22 Jan 2019 00:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=kZr0fYXLTDuQhA7Idwn8AXJc8cbOUQt42CeU5kkGDzM=;
 b=uM6MvBg20Qq29jwM8GsPMKR9cmQ2IwbVjzJWQRJbIKtfHk/YMlI/y9l2jhdRxNrUqC
 W8DULMM40djroBFBgxiSzwKtAEHM3HMJC3JaL45AS3w2xxCzGUv3A0oifxCuWiLK2Lmv
 Rvq1fZlE4RVqfoKaWZSXhGUa8dkkSF1pNCxqqf/S4UrRR+XJPeSXF3ydYKeZFbNLph85
 cUMAIK23+V846EyJbzly4lQp24CGWg94vAIqxxM9qSZUqGLkiBdpXyblmiQnwdRXgNwl
 WhZ1vvWDD8hZ3zhq1Xn2kHiR1ojSw3FvHROCgcNMjoRBKCToJG6N9tB/J2FynqZWpg8o
 crtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=kZr0fYXLTDuQhA7Idwn8AXJc8cbOUQt42CeU5kkGDzM=;
 b=Rxy18Is6YomGEmERI6j9TbkWre/TeG+BmExshjDld7b3JSZF/Ckj7RdwTKVn+MreKQ
 WEdDwjkE68vXhJs9yBvnorEneAo2TLDqmJaH0icgSgwb2k1dVfNEOKiQFaonACdJspYT
 kO2wHoAtHlAC1BN3HBLYWyFmNAKHc2ZUomrk4MLs4d0P+FSyRgj3o+w7p7D1d21jG2A0
 2kwG2XPZIkN2m1NOAhegkzxV4GUq8fBNACx8iQ1SvS1jaDtKCw9Moe6pj7uGA8pUwJQn
 eNnnLAZx9AiysnyoIooiUqEMXHn/m979a2+Csx53w0y7MUi0lddHTaZOSAXKFPuwW7fd
 npcw==
X-Gm-Message-State: AJcUukcKatI7XuGtet8K/OEZCcy8ZWeleYLCCDH1uGHsGhcTqk7heLdT
 vrj0RzHYI8DnCuthtaNOE0SeJg==
X-Google-Smtp-Source: ALg8bN4hP9cUm8TfDSALBx3GgvgF7ZFeOYtqq7C86ZxIP4jA64gAuD4khKmkql26XdrLqVWmVWmNRA==
X-Received: by 2002:a1c:13d1:: with SMTP id 200mr2654672wmt.4.1548146870859;
 Tue, 22 Jan 2019 00:47:50 -0800 (PST)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f191sm9370369wmg.12.2019.01.22.00.47.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Jan 2019 00:47:50 -0800 (PST)
References: <1547744074-28308-1-git-send-email-lollivier@baylibre.com>
 <1547744074-28308-3-git-send-email-lollivier@baylibre.com>
 <20190121171019.GA2903@bogus> <86imyhapl9.fsf@baylibre.com>
 <CAGp9LzpgZDEdKFH4ZLqxtO60unxXRJoXNsGugNT=oojHDMp+3g@mail.gmail.com>
User-agent: mu4e 1.0; emacs 25.3.2
From: Loys Ollivier <lollivier@baylibre.com>
To: Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: gnss: add mediatek binding
In-reply-to: <CAGp9LzpgZDEdKFH4ZLqxtO60unxXRJoXNsGugNT=oojHDMp+3g@mail.gmail.com>
Date: Tue, 22 Jan 2019 09:47:48 +0100
Message-ID: <86imyh13kb.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_004753_160322_136585C9 
X-CRM114-Status: GOOD (  14.41  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Loys Ollivier <lollivier@baylibre.com>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 21 Jan 2019 at 18:44, Sean Wang wrote:

> On Mon, Jan 21, 2019 at 9:29 AM Loys Ollivier <lollivier@baylibre.com> 
> wrote:
>>
>>
>> On Mon 21 Jan 2019 at 17:10, Rob Herring wrote:
>>
>> > On Thu, 17 Jan 2019 17:54:32 +0100, Loys Ollivier wrote:
>> >> Add binding for Mediatek-based GNSS receivers.
>> >>
>> >> Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
>> >> ---
>> >>
>> >> v2:
>> >> Renamed bindings from Globaltop/gtop to Mediatek/mtk.
>> >> Moved current-speed as an optional propertie.
>> >> Removed the status line in the example.
>> >> Added "mediatek,mt3339" compatible.
>> >>
>> >>  .../devicetree/bindings/gnss/mediatek.txt          | 39
>> >>  ++++++++++++++++++++++
>> >>  1 file changed, 39 insertions(+)
>> >>  create mode 100644 Documentation/devicetree/bindings/gnss/mediatek.txt
>> >>
>> >
>> > Reviewed-by: Rob Herring <robh@kernel.org>
>>
>> Thanks Rob,
>> If there are no objections by others, I'll stop sending these two patch
>> (1/4 and 2/4) and reference any new patch serie for 3 and 4 as depending
>> on those two.
>>
>
> Hi Loys,
>
> Thanks for adding the first GPS device driver. It's really nice to see
> more device drivers added to upstream support.
>
Hi Sean,

Glad to know you're supporting this initiative.

> Do you mind send the series again with Cc linux-mediatek@lists.infradead.org 
> ?
>
The series already has linux-mediatek@lists.infradead.org in Cc. Does it
need a resend ?

> Sean
>
>> --
>> -L
>>
>> _______________________________________________
>> Linux-mediatek mailing list
>> Linux-mediatek@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-mediatek


-- 
-L

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
