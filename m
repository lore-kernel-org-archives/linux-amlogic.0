Return-Path: <SRS0=M8+g=ZA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6076AFC6197
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Nov 2019 22:07:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31EFF2084D
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Nov 2019 22:07:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n9Ax5Qwg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nX5Fa3AX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31EFF2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CtbdL//22/8oAWwsb/fn6yqQJDXCbZNZhpP9nEf9K9g=; b=n9Ax5QwgGle6ca
	KT9MOo0AoxiAmtyFlwM6YmTE5BnCYx03KT3j0wuX0D8Tk+qo/r4QflVlZFYa1nOnhAs9zO0/D3xgW
	KI8DzTyRxT0Dg7t8UWl04Kl1a+Wd1LwjbKHmM7x1IBoY5V+WKdgAhpohXzGj1Wm7d1xWX6IwvF1uJ
	JyuZjm0jNHNng4skOM0Zs3Z7H9RZe3CGv1sYAc5dW2r+1VZYVqotqRKfyC/Vqg5Xee4RSk8mGIE7J
	HONM7mRDHLVLe8G8EL7xCPlIJ8aGmurvNzU9Gub+0JjYtqV37uR57bzx3DfknRvMYMM1ZrMR+XqI5
	C5dk/XCC+DU5OqSJq8ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iTCPl-0003uv-RO; Fri, 08 Nov 2019 22:07:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTCPg-0003nk-D1; Fri, 08 Nov 2019 22:07:29 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA7F321848;
 Fri,  8 Nov 2019 22:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573250848;
 bh=gLwm52RY9G/9492fo3p2MflMQXw59u4hMZtGnCihRjI=;
 h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
 b=nX5Fa3AXOotSVNgz+B4jYyonyO9RE9BQ3kFBxu0zn8Q18WcuTvegmFPzPBt4AW4CJ
 EfRdNBOoGtyKd3Ry7sXe2l1NJGVMvJNNVFu2CjeLACYvPiXqeKhadRBcYuAF0k/+qF
 yZ3gj8Or59VrVJqO3VE5/YX41ow5SrsYAYpopDOE=
MIME-Version: 1.0
In-Reply-To: <20191027162328.1177402-4-martin.blumenstingl@googlemail.com>
References: <20191027162328.1177402-1-martin.blumenstingl@googlemail.com>
 <20191027162328.1177402-4-martin.blumenstingl@googlemail.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 jbrunet@baylibre.com, khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 narmstrong@baylibre.com
Subject: Re: [PATCH v2 3/5] clk: meson: meson8b: use of_clk_hw_register to
 register the clocks
User-Agent: alot/0.8.1
Date: Fri, 08 Nov 2019 14:07:27 -0800
Message-Id: <20191108220727.DA7F321848@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191108_140728_480935_6B36C494 
X-CRM114-Status: UNSURE (   6.04  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Martin Blumenstingl (2019-10-27 09:23:26)
> Switch from clk_hw_register to of_clk_hw_register so we can use
> clk_parent_data.fw_name. This will be used to get the "xtal", "ddr_pll"
> and possibly others from the .dtb.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
