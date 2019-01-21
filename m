Return-Path: <SRS0=UU9i=P5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC87C31680
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jan 2019 17:29:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A04ED2084A
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jan 2019 17:29:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CXw4S4/P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bPItQ11I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A04ED2084A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c2OwMWuTQcqFJ62rEvER7Elm0LtYomtBRtWVdWCSI2o=; b=CXw4S4/PImbJMYGSG2Jh+dBqm
	IuKycVF9e2QA86pmMQ9PxtNYucKrnBfHrKjR3v1sFTjTEW0QK2EQPi3QKrYMzb/FmWWMmKni5POWz
	LcKvExwsWlTPo4K54l9EN2V7U+VL+cPHlUhBi0t3mt8ynXNlYFgS12Kibst6sFeyi4VPaXfpF2lzp
	M9z3SMSU4zdvEkLLhs5E2FkrQdJ+6X2XQFlL0Wr5pGDlkMZ5aDLYa4XbJ/2PGXIeqZMZi+VkXqH6F
	YEQIKn6JbfFpNhF4iqR6EdiubaddjsBYIXtvIhxTnJPqSAvnlcIIVpsKDJG7c6XiwIM+XrOiX44AT
	k2TwCBJ6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gldOP-0008Dv-A4; Mon, 21 Jan 2019 17:29:49 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gldOB-00081v-9g
 for linux-amlogic@lists.infradead.org; Mon, 21 Jan 2019 17:29:37 +0000
Received: by mail-wr1-x441.google.com with SMTP id v13so24351731wrw.5
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Jan 2019 09:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=fevEhq1ZsnQYiONWisKFgrF2FMIWgLVBZ7cBkGFWRzs=;
 b=bPItQ11IUHbzpz1QxTtVdytwKZ6VWQGLR1BKJlsmQpd1iF+RkD/0fAmDud7Z+VsRXL
 aZAqRuQ4llXIAUAuPCmlNCSReP/t8k8OglRq6+mEllr31JCvZdicbWT8v0m8Nn8vprUy
 /HeEXzeWBau0iG+u+RJQT/0cVF64sxlEKbbQkdkYBoPQ1XdsYXdnb2tBDHVQS75Up+Zl
 G8FT1zIcbXuJFjG2sSvtz03LmBo/08f0a07mjrAtair27m4IDrKZmAAUG7hdBd12Yfqx
 EE20FgB5kE3xCovE5j2+t5Eom3iiW+3vvQe+4AzmP/Xfhft1H5NJlCKZV1v6j2BjibUd
 D0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=fevEhq1ZsnQYiONWisKFgrF2FMIWgLVBZ7cBkGFWRzs=;
 b=RCLoNoB5PCdSZ60oZbx8EZrEGK+6cc+mY5GDonr6V8xT46vglWMu0UqZ8iY+Gz5TJQ
 PrLQZxl2i/PhypIXaFUr8vF8bXaxyzvPcb6yiIAXsn6B/6TQbOoIlYxQu4fUOKoRTr7c
 8O/JS2PYngjjtiqr6NIld2gc/sesMxJNafAsjFKYcn7vJbBqYsSkeS56EYU8CI/kv2Pi
 eGHzZMIanlzrngOQ9YNYQx65B5bTR1/mDf+XJNCYGWiUyoWOUAWAD3n2qtGPKCt2Vn1G
 eMVNHfQJ+TOhc/8G0m+AwVvpQbs40S/iKhwbnGtkAF/WsFCXSkLl/UZvQ6sO5aUFG1hW
 F/3w==
X-Gm-Message-State: AJcUukdUUijkLz+j7sidHDHozXXzc3EyF8zOKmqd2Zla+L0TN2jbOL4l
 KG+eKuXd2SB6og4BY2maf83bLw==
X-Google-Smtp-Source: ALg8bN7tpv/auSIsJ0/uj08hI1z/+4n+sDSx17gm5FI5xX5pj1+MbZykBPpq3Rv5o3PcpmbODvDkWQ==
X-Received: by 2002:adf:9168:: with SMTP id j95mr28466115wrj.217.1548091772762; 
 Mon, 21 Jan 2019 09:29:32 -0800 (PST)
Received: from localhost (amontpellier-658-1-219-17.w109-210.abo.wanadoo.fr.
 [109.210.118.17])
 by smtp.gmail.com with ESMTPSA id s5sm32686088wmh.37.2019.01.21.09.29.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Jan 2019 09:29:32 -0800 (PST)
References: <1547744074-28308-1-git-send-email-lollivier@baylibre.com>
 <1547744074-28308-3-git-send-email-lollivier@baylibre.com>
 <20190121171019.GA2903@bogus>
User-agent: mu4e 1.0; emacs 25.3.2
From: Loys Ollivier <lollivier@baylibre.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: gnss: add mediatek binding
In-reply-to: <20190121171019.GA2903@bogus>
Date: Mon, 21 Jan 2019 18:27:14 +0100
Message-ID: <86imyhapl9.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_092935_354386_B505CA99 
X-CRM114-Status: UNSURE (   8.47  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Loys Ollivier <lollivier@baylibre.com>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 21 Jan 2019 at 17:10, Rob Herring wrote:

> On Thu, 17 Jan 2019 17:54:32 +0100, Loys Ollivier wrote:
>> Add binding for Mediatek-based GNSS receivers.
>> 
>> Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
>> ---
>> 
>> v2:
>> Renamed bindings from Globaltop/gtop to Mediatek/mtk.
>> Moved current-speed as an optional propertie.
>> Removed the status line in the example.
>> Added "mediatek,mt3339" compatible.
>> 
>>  .../devicetree/bindings/gnss/mediatek.txt          | 39 
>>  ++++++++++++++++++++++
>>  1 file changed, 39 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/gnss/mediatek.txt
>> 
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks Rob,
If there are no objections by others, I'll stop sending these two patch
(1/4 and 2/4) and reference any new patch serie for 3 and 4 as depending
on those two.

-- 
-L

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
