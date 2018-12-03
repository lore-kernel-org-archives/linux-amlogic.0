Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BFAC04EB9
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 17:56:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D248208A3
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 17:56:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ozwjzlHa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="M4ykQmbz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D248208A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-ID:References:
	In-Reply-To:From:To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MME8RDLaqlGm5oQr/Z19voGb3GCHf6vpvylph5vVRj8=; b=ozwjzlHa2NVe/H
	5nZVKIzaiVu5RU8b79O/ItBlPO9bTzjoFMOKw5eN7I2GgJpKepAqS4rDuCoZ+285PDCt95mkwj7K0
	RZaT6qNep5cB7kOkyUqJYK90nQkahmm6gfEur7H7KY0qLW1Ecw5oeLSENFsgBvLSdenD+s3pi8MY/
	Ic/lu/7SQ3rkAuNTxq2ZOSkjnYYO/GV0Z8jt4taZh8nevRhYo0aqRpmmRPBbFj6GILQvBSx5qSbX+
	ciHhjTB/YE4aUHAiWQyWF/FYpwdVahH+b4Qg2oGY1EwiSKDbRG1woSwxkpm9I2opoNeYYz3qgfkis
	X2uA4fTPitJsHy7LSjsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTsST-0001K5-DG; Mon, 03 Dec 2018 17:56:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTsSQ-0001JF-Le
 for linux-amlogic@lists.infradead.org; Mon, 03 Dec 2018 17:56:35 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D8A1820848;
 Mon,  3 Dec 2018 17:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1543859784;
 bh=OlwM6ZeUCdc9LYTEjXWmt5ek3UMyWxInY9c+rzoIVH0=;
 h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
 b=M4ykQmbzN1t3HxXK9u8VrM6hHpuyUzog4T/mlFYjTzrF+q9semODbOUcpydC/IIQm
 FxtR8UMzt0u6px42MGIkTjwqUylDUkQGrn/gMmZKNEf1cGq7fbrwvvoiKcJZkKK4Jl
 /Y1OMaAgS6aQ4zf8NsbInFlIQUc1BRHBJ/Utj3xs=
MIME-Version: 1.0
To: Carlo Caione <carlo@caione.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181203171640.12110-2-jbrunet@baylibre.com>
References: <20181203171640.12110-1-jbrunet@baylibre.com>
 <20181203171640.12110-2-jbrunet@baylibre.com>
Message-ID: <154385978324.88331.12597456598061904548@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH v3 1/3] dt-bindings: clk: meson: add ao controller clock
 inputs
Date: Mon, 03 Dec 2018 09:56:23 -0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_095634_725736_7950E213 
X-CRM114-Status: UNSURE (   4.20  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2018-12-03 09:16:38)
> Add the clock inputs of amlogic AO clock controller
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
