Return-Path: <SRS0=nO3E=L5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB3FC07E9C
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jul 2021 22:35:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF47E6103E
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jul 2021 22:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF47E6103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rm5ndBAwNl7U3b+ILYW4Pi1HZAebrT3lYbDpueisLtM=; b=piKnlHcK0Ujmqj
	+WnKtY8l93kHoe9gOdpV9XxVS9EVefBFdOIZnNj9S0wGyRfK0ziIfbIGxpdsoKLG24jtfkKpKb0b9
	fllo7AMOJ26dZ8BCKFhLzESoPVFIIhDR5afTDWY8ETvLu1ZKr9f20iKxb8c4srXq9h7jlN6d3FLCQ
	7FTraL8gcabyJ/poT28iH+DAIlwm9F4ynBEczyDPC3sGd2M0MRjPu3Y+CQpLZqcIhA9seuFlx/nUv
	pIiikCjO9lGHgpQ13eUdupYsjLhWqIhz8WYREY5f6swJSHVZ2DYrXb2JDgirmjZX8baDXvx4KlOkQ
	QMURphRWackQ43D97YWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0XBE-009yWy-JC; Mon, 05 Jul 2021 22:35:08 +0000
Received: from mail-lf1-f54.google.com ([209.85.167.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0XB1-009yV5-2V; Mon, 05 Jul 2021 22:34:56 +0000
Received: by mail-lf1-f54.google.com with SMTP id r26so17340849lfp.2;
 Mon, 05 Jul 2021 15:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=j1caghW4kfrgj6lvZ4VhPk/s9QzfestewBqrhQF3bF8=;
 b=QvxvHx7JVB++Ls5yesQSrGjQNa8KvAeX2e8/HZyG5/UC25XNJlI9h+fHenw01vQlqR
 T4MyHWUtp982flE9iXwAfJnCv2xDxeMv6r5t51DlvZl3I8C1dHN1NbaXhnHR7yltRZiO
 r6RIFgGs7lEZsf+QyQZ9tE5S24FTSJXz4vUAXkBAjplDOWJtfJA3aYWvNd+bfJFdxswl
 ZrPwqOM185S8LHWUUvwhDeoZ28YWS3jIAy2AT81D7Vc492dTOA0O0BFEzELtwuV9Zy84
 tOQIe21Yx731cCoMrlpfGUCjZquQUzBmHZvw5IlQ7+LVWrw5SQl09h/SF/iNfKw3YK1F
 WI4g==
X-Gm-Message-State: AOAM532pQYCDfzXtt2GpIofZoDsACxuiXxF5Q8yVhzBmTQRdZp+b9zI9
 nujXfL7K/RPhmYYkbt4gYZk=
X-Google-Smtp-Source: ABdhPJwWk9FwUUI2LNR78S2WGXbwmY6zTo3fY3eH4MP9Eq16Gp6VELdkkizH/gvghaG/sDqFjkIzsQ==
X-Received: by 2002:ac2:5619:: with SMTP id v25mr11738645lfd.434.1625524492430; 
 Mon, 05 Jul 2021 15:34:52 -0700 (PDT)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id f2sm1506566ljk.79.2021.07.05.15.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 15:34:51 -0700 (PDT)
Date: Tue, 6 Jul 2021 00:34:50 +0200
From: Krzysztof Wilczynski <kw@linux.com>
To: Art Nikpal <email2tema@gmail.com>
Cc: =?utf-8?B?6ZmI5Y2O5omN?= <chenhuacai@loongson.cn>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Yue Wang <yue.wang@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 PCI <linux-pci@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-kernel@vger.kernel.org, Artem Lapkin <art@khadas.com>,
 Nick Xie <nick@khadas.com>, Gouwa Wang <gouwa@khadas.com>,
 chenhuacai@gmail.com
Subject: Re: Re: [PATCH 0/4] PCI: replace dublicated MRRS limit quirks
Message-ID: <20210705223450.GB142312@rocinante>
References: <20210701154634.GA60743@bjorn-Precision-5520>
 <67a9e1fa.81a9.17a64c8e7f7.Coremail.chenhuacai@loongson.cn>
 <CAKaHn9KxRrBsn4b9fSO1eDzM3XdV2GzfwVX+cGw9uS_eKg75dw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKaHn9KxRrBsn4b9fSO1eDzM3XdV2GzfwVX+cGw9uS_eKg75dw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_153455_160304_35BB82B0 
X-CRM114-Status: UNSURE (   7.37  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Art,

[...]
> If no one has any objection, I can try to remake it again.

I can't speak for everyone, of course, but I am sure that nobody would
object if you decide to work on v2, so that a proper fix can be applied,
and issues fixed long term.

Thank you for working on this!  Much appreciated!

	Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
