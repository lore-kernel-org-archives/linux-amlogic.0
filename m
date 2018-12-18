Return-Path: <SRS0=QuO6=O3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B8FC43387
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Dec 2018 23:15:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0BBB2184C
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Dec 2018 23:15:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LC/VymSJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="OxpD0mQe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0BBB2184C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MLdatrN7BF6hIDtB7cv4dH3RkQhgRwrWgwpM/6qIE9E=; b=LC/VymSJV8PR99
	xObp/HqNiCwknTG/Sq/BJ15FE6UtWEy1/DpQr48WxGX4yxCLqYO1bi0BUq/FC0zDuwj8Ol6bl7X4b
	4w6yr2dHu8yhCN/k6/+yKp8FzJKZL/gTtdtTj7mLcY8Mo8AlsVVem6PKgEli8mqv00+yagGKZzdbw
	1lpjhLviyvSBO29Ug+P/2KYJNlCGJYPnrHElYm2rKqMvaQPQGTeuQ1+blEFGYR9KS2ft46id9iR7e
	bXnxjT//iEVsBYvmmnvdkKrGYkA5NVKT74OlCFJbT4I8FjrmofvokRDUgIX7qQn+KhjdAtNlyUHIR
	xx7pFk7IBA7Jdo8XWxkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZOZv-0002aT-AV; Tue, 18 Dec 2018 23:15:07 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZOZs-0001rg-CX; Tue, 18 Dec 2018 23:15:05 +0000
Received: by mail-oi1-x243.google.com with SMTP id y1so103076oie.12;
 Tue, 18 Dec 2018 15:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LM+SCpKm1SU1QFp2bGgNH/8e9PzJQO0K0O14ThmeN3w=;
 b=OxpD0mQeuQeGBYU0leEKzPXqYmm4bbtVOTuO+KqCGT1rsd9uGsQXwQAY/VJdiRT46w
 jMa/7G3gHNKgzX+TLge4JHMpygzlsKC7RgAtUo8gcP2C5fM6h4lKNv8ezVbyJHeh1qOR
 zP//bDkR3/jxxGAD6wqgFJFI7CCJVC0CWfb+B7eBduNixQcyphOtZnDXXlSoWC9g8LoM
 G51s88dNk2Uv0rVizGY0hdoO4tE/PhTvw651rYL5PqBezW7fTylEi7anV1dqRbTR1ttu
 ajnNsxOjDWhMHGXm3o6iqmAWXM8SXrU6QNbOP/elQtYPxU3F2wT1wbeG1t1mmE0Mfu2x
 /qZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LM+SCpKm1SU1QFp2bGgNH/8e9PzJQO0K0O14ThmeN3w=;
 b=BkCRdj5IhshWwUd8XK40DZjc3btenuziOj1hcMqvLakduus30lCAUN0uBDTKBKpV6d
 Qm5VA/FT+rrKw8Q7+ktf+ugJzSnJckNdZsbAviRUwHIH+ww3+lH0CsiWyqoAH7SgIVc+
 edjKC4McBje5VfI/yyIs0Y9H7uO1LTPLmDHD1s4lC9OdhN4M4e1oWp0tNWtbyK8mvNCM
 CNO4AjhR6xcpONMyhePIJ/aqOohSucfqY7kYGBQa18sWi8jydYKuQNkBk1PZZFx8uTm0
 9g7p4ook03U1atTuBYlG6TCPH5T2rcYO4BiwFEDvBb0WXgMY6WzCQlsEzsaQ/3uXKx4j
 RDDg==
X-Gm-Message-State: AA+aEWbOFH6Op2zO5f1OzUqIyW/cxAXWPw3venu9TxevSlTJjJyi5wX1
 Kv1ZbG7lgMaWud3hBi3qbAC8SlZiiq+0nMY2+VUklOkd
X-Google-Smtp-Source: AFSGD/UYqTj4MR4JR5pzJ+fkoG2pt0w0GjynKLFCNxcIFpA7U8r/WDYWTwbT1b8Rmvj11JB06oFrZ/iSCeCNJcYWpvY=
X-Received: by 2002:aca:58d7:: with SMTP id m206mr9368690oib.140.1545174887971; 
 Tue, 18 Dec 2018 15:14:47 -0800 (PST)
MIME-Version: 1.0
References: <1545120286-129258-1-git-send-email-hanjie.lin@amlogic.com>
 <1545120286-129258-2-git-send-email-hanjie.lin@amlogic.com>
In-Reply-To: <1545120286-129258-2-git-send-email-hanjie.lin@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 19 Dec 2018 00:14:37 +0100
Message-ID: <CAFBinCD1x7jcJJx78yNx87MOmKQ2HuSBeRpDRQE0hyNCwm1JAg@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: PCI: meson: add DT bindings for
 Amlogic Meson PCIe controller
To: Rob Herring <robh@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181218_151504_454063_44CA5ED2 
X-CRM114-Status: GOOD (  10.20  )
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
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, linux-pci@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Shawn Lin <shawn.lin@rock-chips.com>,
 Yixun Lan <yixun.lan@amlogic.com>, linux-kernel@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>, Carlo Caione <carlo@caione.org>,
 Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Cyrille Pitchen <cyrille.pitchen@free-electrons.com>,
 linux-amlogic@lists.infradead.org,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Liang Yang <liang.yang@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Rob, Hi Hanjie,

(sorry for being late with my question)

On Tue, Dec 18, 2018 at 9:05 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
[...]
> +- reg-names: Must be
> +       - "elbi"        External local bus interface registers
> +       - "cfg"         Meson specific registers
> +       - "phy"         Meson PCIE PHY registers
I have learned that there are two PHY register designs:
- AXG only has a PCIe PHY
- G12A has a PHY which supports PCIe and USB 3.0. The PCIe part of
this PHY design is compatible with AXG, but this design also supports
a USB 3.0 port (it's an exclusive choice: either PCIe *or* USB 3.0)

The PCIe controller itself is identical on both, AXG and G12A.
This patch adds support for the AXG PCIe controller and PHY within one
device-tree node.

For G12A I propose to add a separate "phys" property with a phandle to
the "combo" PCIe and USB3.0 PHY - this can be part of a separate patch
though.
I would like to know whether it's OK that for AXG the PCIe PHY is
described in the same device-tree node as the PCIe controller (in
other words: we're not using a "phys" property here)?


Kind Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
