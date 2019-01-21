Return-Path: <SRS0=UU9i=P5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B73C31684
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jan 2019 17:09:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C7C320879
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jan 2019 17:09:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X4PSUl43"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C7C320879
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LyLWLJ2wnqcvGi19o8Zyit+uwnE16qvMbZ6d4wfjerI=; b=X4PSUl4338Jfm1
	PE2kpzVSYmyqmFuCzUq354ZkN17xJfs2mnKlRN18FACrtWZGO2Eh7eC0nRPmqGASFo6EPEBYpGeYK
	nLcCsH+jT4DFx3sB7aQePbv+/icWKkS7lEFatKJ4f54Mw+5N17biSxCf00DaqRBVNfqLCYv9vJ8NH
	gXOoJ0rmTt43UIoVjQNwgylmC26CJ+ss2qC95sMDBhDaCBcaZKBLhvY/Lq7SwfSu0A6m/wdDDDj/F
	sHWjNnH2E06lyEdDgiWJ7rovPUhxOeIHJM0o19ip1LOiVy6vE5lFvRXG2DMKO/KjWoa9l0t0TWbXW
	NpYkzRByk1KP3va13Hkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gld4U-00064s-Dd; Mon, 21 Jan 2019 17:09:14 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gld4S-00064O-1Z; Mon, 21 Jan 2019 17:09:13 +0000
Received: by mail-ot1-f65.google.com with SMTP id k98so21156965otk.3;
 Mon, 21 Jan 2019 09:09:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vxe1DFDMhLD+4kqrUQTKR+OGErAZITvYwBYiudjM6vI=;
 b=l8Y4lZWzmot0O/KeMtxMCp6gcPi75fJ7IZszOQgFPT0z+eYq/r8gJr0CTIFihYmSWn
 QUQRnvUkT74d6Rhe/GvOx0vzsPYpFJmDADJnMfFv8988LpVgpMGTZD/n1hRYCbFRF85K
 HZMw7H+4oIcHJ+RuU37fkAdEdYmNlJ7veXO1fj/nVJaIJ/HfSpRmTd94I7FeQE+3sxWp
 oHtFzZPvB62bq2l0uPNrjJMElBXsIOW+wvwq9iIVgfIwZMIcFZnXEaaPT1HvM0s3/RAZ
 v+xuEv1XHwujpKA3E5ZcX+o7AzVh7Dk+vgsoYhjqGD1NirRWsBiqgX/u7TiMB5ry0j0o
 9lfg==
X-Gm-Message-State: AJcUukcWvOSfrdCfCT3zRQ8dPdmfePxw8/79//B0f4Vy9c6Gh2ZSy+T/
 gfsAVvnAukdRQDiyxV4f3A==
X-Google-Smtp-Source: ALg8bN70UicKRfjEbeAmBk3kNr0Bl1UzyYzhbpkChDu+hQDdebX0i1p813vFb8bGrLNVb7yXvHNCjQ==
X-Received: by 2002:a9d:620f:: with SMTP id g15mr18845099otj.296.1548090551140; 
 Mon, 21 Jan 2019 09:09:11 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l6sm5754831otk.51.2019.01.21.09.09.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 21 Jan 2019 09:09:10 -0800 (PST)
Date: Mon, 21 Jan 2019 11:09:09 -0600
From: Rob Herring <robh@kernel.org>
To: Loys Ollivier <lollivier@baylibre.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: Add vendor prefix for "GlobalTop
 Technology, Inc."
Message-ID: <20190121170909.GA928@bogus>
References: <1547744074-28308-1-git-send-email-lollivier@baylibre.com>
 <1547744074-28308-2-git-send-email-lollivier@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1547744074-28308-2-git-send-email-lollivier@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_090912_091473_E9165CCA 
X-CRM114-Status: UNSURE (   9.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 17 Jan 2019 17:54:31 +0100, Loys Ollivier wrote:
> Add globaltop vendor definition.
> 
> Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
> ---
> 
> v2: Alphabetical order
> 
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
