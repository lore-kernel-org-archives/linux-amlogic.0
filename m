Return-Path: <SRS0=/MY2=SU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A2FCC10F0E
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 20:18:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29F0120869
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 20:18:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q9YT//Lo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="p9rF2oUx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29F0120869
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uF9o7fLBc0fyOQOusdVhWICXolyQ2ZtkTTETjz51w64=; b=Q9YT//LoZqg7qa
	dZ1E8DS606yc/FdLCdbCjK8mvTpA4i5h+vePO6+lPs8Q1f5oujKXvyq8U7EtxJC3hL1mum7++zJvY
	gvbCruJ/bvauuSY90leSv2v+kLzTEaSteZssNWRFtLZp4yqDrQVhRGZQga102RbvDcBicinz74F+8
	ZbWVx2EbqTi0hJYImFxXRAdNOiPOfe3MjPkcBiOm+bTdsLiMWRbgLOVRes4zc5AaszUXLFhdJXB4K
	dzgPb/I7R50b+0KPAJmBn2PxsP47vwVMvPaZOT9BpH3Cwe++ypZskyr6xAcjBinz3PSXYCklPI8md
	sN9UyrNFuzWqP2Hpw9UQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHDUV-0003lI-Lw; Thu, 18 Apr 2019 20:18:39 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHDUT-0003kx-O1
 for linux-amlogic@lists.infradead.org; Thu, 18 Apr 2019 20:18:38 +0000
Received: by mail-ot1-x344.google.com with SMTP id m10so2779630otp.2
 for <linux-amlogic@lists.infradead.org>; Thu, 18 Apr 2019 13:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w4uKOm5z3nUZHEwv2q0U/OJ6XUlDCtJlvE9SB0ftnIU=;
 b=p9rF2oUxcSW/fr5nED842zaQPHsd7xfHMXWgNhk/41PD23hUd+ZQfR8u4a0wS4/0Bt
 sOsjY7H7xcNNrj7w8WgnHIsf9kh64Bl2ahMXjgiQNqpKUP4NYTD3jq1a57GMBQIOq4WU
 5wXeehMLtFVq8byJH/80QF2gx/fW1olQQxWB6kqZCy3zUovLhmig7Ihu0mc0jEtbLShA
 /lS4cLwbrkykdbtiOWwENxD/jO1oWjaiRucolflvTUdOWXa0H+Kqdef3wg0cdlt8izg/
 BbltCE64d8yr/2FsRpQ/m6+vBDb43E3qit1J4LsdJfeVySSSz6v289taBgUUPuwrjEVs
 Ns0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w4uKOm5z3nUZHEwv2q0U/OJ6XUlDCtJlvE9SB0ftnIU=;
 b=Sw48UkoDW1R4md4hC34Z2udKCbAw3TToM+k+o+nm8tYqNNZkdBZfY2SYPxnjPfPCiD
 mW012NqoUktq8QUq+0ohz2QAEDHQz8ef0eIB/iQypmO0+zBQBaw/NRx7tLdYLL3Hpg2m
 VPUuGO6oeCzpgCVrfLFamT4uqD/pcqmfSPrM3cKSR1rByP6HbUprnw3/q8MFX9h0VJnJ
 3g/R8qQVvR8KBOeI6FWA5MrrFAznGqBP2YZkkARDn1Ro05/nMR/V7/sSnOcj58dR6iag
 mRS2OIjrRA2GElQUcKszwue+NGZguTXi3wiGtkh8BvZPjmaxTLZBGYFEk9/Zx48buInI
 gMvg==
X-Gm-Message-State: APjAAAWOBLUNgu3okWnvCXt39ciZpZ4/nEcwJEq0hjRmfHhJ68NPJn2R
 mluZ4BdhuYNAt1YuhflmI/cyFnXYN+A/oN/bcyc=
X-Google-Smtp-Source: APXvYqyq6dBgPm5Sc5v35NoLipsVAWZrWf43pIQvXgq372Jl54xTlohkffpeUMcZZr3yvFiUD16IduSY8yGD7Nf9WnQ=
X-Received: by 2002:a9d:76d5:: with SMTP id p21mr57213094otl.308.1555618716898; 
 Thu, 18 Apr 2019 13:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190417204355.469-1-jbrunet@baylibre.com>
 <20190417204355.469-2-jbrunet@baylibre.com>
In-Reply-To: <20190417204355.469-2-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 18 Apr 2019 22:18:26 +0200
Message-ID: <CAFBinCBM4r5qxhk9rBH0aqdHSg76hyNMOi9aAJG-hGJDHY-4Ow@mail.gmail.com>
Subject: Re: [PATCH 1/7] mmc: meson-gx: remove open coded read with timeout
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_131837_780767_9B1A1512 
X-CRM114-Status: UNSURE (   8.14  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Apr 17, 2019 at 10:44 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> There is already a function available to poll a register until a
> condition is met. Let's use it instead of open coding it.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>

and on my Khadas VIM with patches 1-4 from this series applied:
Tested-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
