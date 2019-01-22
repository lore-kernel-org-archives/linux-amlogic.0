Return-Path: <SRS0=xxvR=P6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 656F2C282C3
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jan 2019 08:49:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31D4A2084C
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jan 2019 08:49:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o+l+mkCs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GXFRACbU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31D4A2084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YDzjx84Bh7CW45SVNu4yzgMycZgu7C+yHRKGBA6lUkM=; b=o+l+mkCsM8KFH4hyZvmTfPSng
	7ebtXKRYDlFbh39IAhpojA/RnQsGbMvErsoSPFfml+lOxOOXEz5kNHe+uJqiIhK7FcJQRTdbdhYhl
	e4oXSaAjgxCaBe0DoU5Y/9XRuTCAHg+y6mW++X2Scwx0QfnrokNEpOkLNLet5hvSYNECpigKbOi16
	po7mAPI3AVDrIgw4OJBo79FczuK0l1ZKQCIFRXm46PbihLO6EmpA6fU/a9y5M9jT+S2gI8SjZRL7B
	gAsPbKT3Y2g5/LstZb5t5IJAMF6h8SiT4EWRQ7gtew5C/titd5OL5fbQEipD/cZoXB7ExI3+f25Es
	0Q+gjs+KA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glrkD-0007aV-Oz; Tue, 22 Jan 2019 08:49:17 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glrkB-0007ZQ-5c
 for linux-amlogic@lists.infradead.org; Tue, 22 Jan 2019 08:49:16 +0000
Received: by mail-wm1-x343.google.com with SMTP id m22so13358034wml.3
 for <linux-amlogic@lists.infradead.org>; Tue, 22 Jan 2019 00:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=jsZVf9y2K5LHFnrE1GBsBerxCpBqq1IDtHSFbWLJLe0=;
 b=GXFRACbUCd5av9832M3y7+x0jssy3Rl6gykAD6/iyFlZsbDYt3/B3O+mwJ/9wHpGwq
 lr1XC6eYO8DrLF2sTNRAEHT+gM3ddDixAOkZM922l9bBAQVqyhtuHJX9QBrr4wLIS305
 emSys4QcKtjnie+SndHAWHue/n6RHJ3qgqUJuzOlzyW735dB2dSn8QUMqOF4CVohSMnM
 EA0tW5eGmt2KtS1E+1g3cizqQDPaD8mMJpnqE00gmuW1kbKyfHNiPCJRoiYKDkdVNfMY
 ps+12Q0IgULqBWATSicnA9Sr6n2WP3H9A2X3bk+gyvC2ZzibRVyySVv84az4ytM+yZ0l
 vX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=jsZVf9y2K5LHFnrE1GBsBerxCpBqq1IDtHSFbWLJLe0=;
 b=XMhQNJCUud3EHK3/nrp4lMbGaxO5fubCnXb97rtd1WmbJ2kb0qYx3fChDJ/NXG/61N
 JbGbt6cj/SJWz/TM9Rt/MxXXk8R4Wat+J3MqYiQpz1YG4J2Cs1eIojeoW2KBEgju69qp
 rBE9tuw8DabR7IHF/uG/aq6bKq2B962c4iQSmzalnLIVLOkT+947y4kxZu0QZjbIrCnF
 E87wgl9CjcHsgtZf4LT8IvXqKlG+EzRw2Lxr7Li3unTFv7yFFechZLR4Wc4bMJX4DAgO
 AXhn7+G51mx9q8iexqAIwZ8rZOKKbeQwiglSHDp29EKylb7vTL/mo4m1IYj5Pwkr7ahI
 qJwQ==
X-Gm-Message-State: AJcUukc7/iXpAsZl8ni/OS568V+/UlaAcQMaBEbh1kHjGGy8Q7fLsXz7
 e9sAmBfYk0EpMyDO+zn/t+bHnw==
X-Google-Smtp-Source: ALg8bN5PUGA1BWoPvnuNjH3HWDpP7aN0lqtUu1dsis3w0jNzwjnlhrgSXW1VdWZPoO5ZQjSgX4dXJw==
X-Received: by 2002:a1c:f707:: with SMTP id v7mr2744114wmh.18.1548146953452;
 Tue, 22 Jan 2019 00:49:13 -0800 (PST)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id n11sm33115268wrw.60.2019.01.22.00.49.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Jan 2019 00:49:12 -0800 (PST)
References: <1547744074-28308-1-git-send-email-lollivier@baylibre.com>
 <1547744074-28308-3-git-send-email-lollivier@baylibre.com>
 <20190121171019.GA2903@bogus> <86imyhapl9.fsf@baylibre.com>
 <CAL_JsqKVgWnLXGWxydj5HKiKeZ5Vf7HAgyr8+PkvrviUAwNW8w@mail.gmail.com>
User-agent: mu4e 1.0; emacs 25.3.2
From: Loys Ollivier <lollivier@baylibre.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: gnss: add mediatek binding
In-reply-to: <CAL_JsqKVgWnLXGWxydj5HKiKeZ5Vf7HAgyr8+PkvrviUAwNW8w@mail.gmail.com>
Date: Tue, 22 Jan 2019 09:49:11 +0100
Message-ID: <86h8e113i0.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_004915_218849_1CFE32F9 
X-CRM114-Status: GOOD (  12.31  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Loys Ollivier <lollivier@baylibre.com>,
 Johan Hovold <johan@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-amlogic@lists.infradead.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 21 Jan 2019 at 21:51, Rob Herring wrote:

> On Mon, Jan 21, 2019 at 11:29 AM Loys Ollivier <lollivier@baylibre.com> 
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
>
> Generally, you should just resend the whole series unless the
> maintainer has applied some of the patches. I could apply this but
> usually the whole series goes in together.
>
> Rob

OK understood, I'll resend the whole series if needed then.

Loys

-- 
-L

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
