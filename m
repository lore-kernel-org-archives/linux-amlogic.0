Return-Path: <SRS0=5tHY=YK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBFDBFA372A
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 15:51:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEAC320869
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 15:51:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SljZiw51";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Q7IFc7xZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEAC320869
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6rOLuGHA8/MQNTvEcw2EKU2jZdklwnMHuAyBpLNbeM=; b=SljZiw51bsnwtf
	35OlUEx1yB2I5BIQPp3jbi4JOyXMVuCGmyWu+dNSz4wJnXq8bWCo9Z8vNiEKVslW6hP06IqzVVSfS
	tF8kWVi71LhRyypNsjesiOmAXjJxX+ahPqEl0+Mtvt72CddzkbH8IQS/C+/gLhesDZGVaBwftlZuA
	twmOVkZK6o6gE6dV4kyeaXz+wtmKSNKW4mDFbb+6/55vQIs6QpkMLywnpWxtkHRyudnGqdiVBtYq6
	yl/RiQswRlEsZBBv1Xywfu3rPMF2OhDVvMv/6lS2EFh9j3D+yItpjxOCOx6sKXuOL4jm+Q8zFanWb
	cUdE5ca6seLlfyIoF5mw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iL83E-0001HD-6x; Thu, 17 Oct 2019 15:50:56 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL83B-0001GM-M3
 for linux-amlogic@lists.infradead.org; Thu, 17 Oct 2019 15:50:55 +0000
Received: by mail-pl1-x642.google.com with SMTP id q24so1304357plr.13
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Oct 2019 08:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=b48asfDAC1xOvEXigDKMakB9AKqpopPhTm0c4Dno6I4=;
 b=Q7IFc7xZihyEUYEqzdNDgyvTR+JI6j7aHEpGPTDNRLWFlTGtfJXqE8f/IF5LuZfSoB
 NhMzEJiu10zAYXuV2qqebPeZYmcXUWFfJjp5JZfvw0xtruK9pfFNAgwLjaz9XPE15Rf4
 +eKD6ZUWoxkShEtqkB3h2ossktGrIafeZiDCY5PHSA0JHbswdZku6KKCLRV6GohcJQUD
 jUSQR0wVwpXS6PUW9keg2SOVAUg11JAnXyN1HctnVfIAN52XRRZoFY2N+mznZ8BTq7Do
 xw08I2su8MdKZBdsPt1Gjj4wcOZKc/zcOc7Am1lPMNYunCX72Q1tQVOiKaUZPnRVeB7Y
 C67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=b48asfDAC1xOvEXigDKMakB9AKqpopPhTm0c4Dno6I4=;
 b=lycIUMqwu0G9UnLK1NREeL0BjJT3eWnOKUAo3BsefSUbr8aFgQET44ctDVcnGGjmyK
 MUIJRrzyLYaszXdNZYH982NtprrPvfl2o/b6Qi10tsv2IMhhDdmqrgq+ElV9Kosl7BtT
 Qnakb7Q8sdpxdqMGKPqTT8jZXy+1iN4mseNiqsxmN95mILuP9B8EboMb/qBqMtlvYqzK
 vmgFW+Oa7DIzdMcfEhAn0uOVJVWIQuxLYz0OAjnR7bsNFQVqLQFtbpP2JrJdTHZCf+5C
 u5cYU6snFkGF2tm5hahLV4zTbfVQ1nFPc79oKzcSmZAsd4M9XhzVtl5QiNXqEQXtCVDb
 qSvw==
X-Gm-Message-State: APjAAAVgDTTr1knNzRo1rrlwLlrvz6U/q+kJQTjAw6yBxWdcRouBovjM
 0mgEIiS34eHJdTPOisSEs6Uq0A==
X-Google-Smtp-Source: APXvYqw+ZkikFWm1K6Ej45vWuAlQyN+QOL993PvKnUyJp89FV9RW4sQzKjWGpiIpHo1wns2qTFvzxw==
X-Received: by 2002:a17:902:728f:: with SMTP id
 d15mr4802632pll.211.1571327452664; 
 Thu, 17 Oct 2019 08:50:52 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:d8f2:392e:5b44:157d])
 by smtp.gmail.com with ESMTPSA id z29sm2942555pff.23.2019.10.17.08.50.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Oct 2019 08:50:52 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: meson: Tronsmart Vega ir keymap updates
In-Reply-To: <1571245657-4471-1-git-send-email-christianshewitt@gmail.com>
References: <1571245657-4471-1-git-send-email-christianshewitt@gmail.com>
Date: Thu, 17 Oct 2019 08:50:51 -0700
Message-ID: <7hwod3bcbo.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_085053_718084_6E697618 
X-CRM114-Status: UNSURE (   5.86  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Christian Hewitt <christianshewitt@gmail.com> writes:

> The Tronsmart Vega S95 (S905) and S96 (S912) Android STBs use the
> same IR remote. The rc-vega-s9x keymap has been accepted for Linux
> v5.5 [0] so add the keymap to the respective dts.

Queued for v5.5,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
