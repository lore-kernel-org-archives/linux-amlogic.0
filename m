Return-Path: <SRS0=ycqe=ON=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD8B0C04EB8
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 17:44:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EE6F2081B
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 17:44:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q/ldv0bI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZnKSKkm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EE6F2081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-ID:References:
	In-Reply-To:From:To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/0S8jEVset3cpoIL8yVrE9xcIAc11QRQvDMAxiY3JD4=; b=q/ldv0bIF12/Eo
	Prnd+egZL2eX5hCAItgfwlDOqMiOU0Lz6fAFJm2/inqBLFM4inQ1suJTkpeOXfy7TODyx2kYH4bR3
	BVqjErtNp48hIv7S5uOGUIOoHlUammJka/Xuf802i8jBK38TdrlD5d0kqoixI4GBDbAeuONmBYOT0
	l7C+Yf8+P+NAdLcuVlHm+07j+inuxiNyZFizpWCFs7uGKN8B2c8rCvghd25R7n7e7CUZeyD/LW0xF
	Di3ITH6CN0L2IxaH5td+dLu7fD+CMyv3n4OLlcBJjm/Y73h6sMZpCXjzYiyFH35eO6tdXGZFDQJMG
	+S937m8g3we57YDRjX0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUEjs-0001zz-N9; Tue, 04 Dec 2018 17:44:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUEjp-0001ym-U7
 for linux-amlogic@lists.infradead.org; Tue, 04 Dec 2018 17:44:03 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 43A102081B;
 Tue,  4 Dec 2018 17:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1543945431;
 bh=RRWDlkVfdE3/Hh28w73eOgqZveXY6VsFj+5N80amkjM=;
 h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
 b=lZnKSKkm0XYj6ORKEdBCdJ2up/CPNDqMXjr3QbsKtOstEoA7iKvIMXbr5fesrxNVC
 jBQ8Qul83Cn5C0CYj/SXbRN0NKrcpC/2v+38/G4xcvcRcYdyLINENtUvzxHH3tbwEg
 KgFDfHTy4O+LBMI728+zRjW3Nib3hVxA9Tx0w4q8=
MIME-Version: 1.0
To: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181204125839.14505-1-narmstrong@baylibre.com>
References: <20181204125839.14505-1-narmstrong@baylibre.com>
Message-ID: <154394543049.88331.11854270462393390489@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH] clk: meson-gxbb: switch video clocks mux tables to static
Date: Tue, 04 Dec 2018 09:43:50 -0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_094401_988551_BFEADD82 
X-CRM114-Status: UNSURE (   6.51  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Neil Armstrong (2018-12-04 04:58:39)
> Makes the following sparse warnings silent:
> drivers/clk/meson/vid-pll-div.c:58:26: warning: symbol '_get_table_val' was not declared. Should it be static?
> drivers/clk/meson/gxbb.c:1585:12: warning: symbol 'gxbb_vid_pll_parent_names' was not declared. Should it be static?
> drivers/clk/meson/gxbb.c:1620:12: warning: symbol 'gxbb_vclk_parent_names' was not declared. Should it be static?
> drivers/clk/meson/gxbb.c:1980:12: warning: symbol 'gxbb_cts_parent_names' was not declared. Should it be static?
> drivers/clk/meson/gxbb.c:2036:12: warning: symbol 'gxbb_cts_hdmi_tx_parent_names' was not declared. Should it be static?

I fixed all of these already in the patch I sent you.

> @@ -1983,7 +1983,7 @@ static struct clk_fixed_factor gxbb_vclk2_div12 = {
>  };
>  
>  static u32 mux_table_cts_sel[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };

I was talking about this mux_table_cts_sel array. Can this be const?


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
