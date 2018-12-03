Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D305C04EBF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 17:56:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65BB220848
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 17:56:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="njLtJW5J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TYeyCa7Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65BB220848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-ID:References:
	In-Reply-To:From:To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PqQfQ7dhFhhADpsxh7FDWPRf1yPt8NMUxgL/d4nZCgM=; b=njLtJW5J0SYpKz
	+SMZMPoItFNKRvHxzM4CNfLlulvZyEEoetK2vrG5+jCoQv3wbjpEJy3yfCBR59VlZZy+nffJP2Q6h
	himN2j/xu1tNa5sxFVVDqBdfQGhRZiCgqSqKCrepRlKqIc6O5mlkNpkLTRfZVebKPoZU2Ei/G+bNT
	pECw12nq6Cd1T/MEGAu8OC3qNFn/NDLuA3o+GPfQ/GOncZ2W9wpzVoT7Siz27S+ACezJx+uUK+jV7
	WE/Pr1BeEDITxrabnRfonm8kd4j3VmUDcPB0yQYoX0/C0l6k4Z7vhzui+UDB3QJwDncGWmfHVdeGc
	KGOehVDMlakuKyMJ3d9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTsSi-0001NH-0k; Mon, 03 Dec 2018 17:56:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTsSf-0001L3-62
 for linux-amlogic@lists.infradead.org; Mon, 03 Dec 2018 17:56:50 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C382620848;
 Mon,  3 Dec 2018 17:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1543859798;
 bh=CSn4G21IeqBbpdt5nPvUfgaqus2UPiQeESkmz/A+yzc=;
 h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
 b=TYeyCa7QGvC3y71kbL5vfsmUgcw4r4misAEs5PnqPhnfv562AJObyaKf9zs8iwjTN
 taCrhJ5lwKl9mNhZOayj58jjaNm7KDniXhSQc1a2yC4DAgpvIgDefJnKH4VgX5HSnw
 Naa3YJ/CKB0TyjDHQAb4VYyLhBjL+n70+r07wpwY=
MIME-Version: 1.0
To: Carlo Caione <carlo@caione.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181203171640.12110-3-jbrunet@baylibre.com>
References: <20181203171640.12110-1-jbrunet@baylibre.com>
 <20181203171640.12110-3-jbrunet@baylibre.com>
Message-ID: <154385979827.88331.4184712339731447171@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH v3 2/3] dt-bindings: clk: meson: add main controller clock
 input
Date: Mon, 03 Dec 2018 09:56:38 -0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_095649_241623_596216F0 
X-CRM114-Status: UNSURE (   4.28  )
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

Quoting Jerome Brunet (2018-12-03 09:16:39)
> Add the clock input of the main clock controller
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
