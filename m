Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AC2C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 12 Mar 2022 02:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=azfM6NU+J0299Hc4LtZGzQS8Yvb5qls3pv4MlAX9QdA=; b=tFSVQQSjmT5TCi
	vyn5KS9rr5W+UVmqDiJPJ1VnK1Ue3xX5pIY8meENRe0UQaYCXGUCrMC1OIrEXaUUKge/pWKMxeCi1
	5Rk/a0V7qdU1zojruf7mIZppVxDbjmLYZQ+w+uvivysLxW+rDDBncIcS1j09fXNAu4M6h8FNgN468
	EzHd5708xj1yIK71XjtsAJoqIYK08XxJZleqQb4OV/dzPN1CZiuL/C/Wd941/yeLeB9/z43zYJZY3
	4iP2oE5FJoJAG80daebWyZEODp/+PkH8Dd1HoKKF6jE77F2UJeV/bQgQvf5YD8zTEy32PBIuMkvSp
	DYKzyDwKn31IsqNQbFKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSrPh-000bqA-3n; Sat, 12 Mar 2022 02:23:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSrPf-000bpT-0c; Sat, 12 Mar 2022 02:23:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83AC7617CB;
 Sat, 12 Mar 2022 02:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F7EC340E9;
 Sat, 12 Mar 2022 02:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647051802;
 bh=H7+KWKVuEkz2ZDnsRcOBekRcv+1e9fwHY0nBxbU/9qo=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=TEqfYNq9bXWlhC8GsZFRVdQy47W6IotvpHIS1jRt3j63yhRnbZZP8tbHw8BbG3yQe
 FJmtBYoVkZ/N3Fl1mwnAspJV79WzaNT3v+dAPpkIAGesrghfnr3QeIK+zLLXyfN3uB
 0OlkxCHPlCukC4DqtQ3NvJyRpL9N+b1XrYY5e8AIvhBjmet8D9oNeo99e5fdS1qnaM
 Ih37ziRKuYXJZRVIwAFmPZzM92oZaYUvaUBUptKE8r+lAp7Qp/bGAydxIm29wQIei1
 dm2RSpTwlB758H5Hq5NPnMFgVuBPVyrvLhXj+KAAip+ViBJSUmTK5dmGuy6jxt0bFg
 OodxViAEyzUpw==
MIME-Version: 1.0
In-Reply-To: <20220222195153.3817625-1-trix@redhat.com>
References: <20220222195153.3817625-1-trix@redhat.com>
Subject: Re: [PATCH] clk: cleanup comments
From: Stephen Boyd <sboyd@kernel.org>
Cc: bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@axis.com, linux-amlogic@lists.infradead.org,
 Tom Rix <trix@redhat.com>
To: alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
 dinguyen@kernel.org, f.fainelli@gmail.com, jbrunet@baylibre.com,
 jesper.nilsson@axis.com, khilman@baylibre.com, lars.persson@axis.com,
 martin.blumenstingl@googlemail.com, mturquette@baylibre.com,
 narmstrong@baylibre.com, nicolas.ferre@microchip.com, rjui@broadcom.com,
 sbranden@broadcom.com, trix@redhat.com
Date: Fri, 11 Mar 2022 18:23:20 -0800
User-Agent: alot/0.10
Message-Id: <20220312022321.D4F7EC340E9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_182323_124210_3FDFFD89 
X-CRM114-Status: UNSURE (   7.16  )
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

Quoting trix@redhat.com (2022-02-22 11:51:53)
> From: Tom Rix <trix@redhat.com>
> 
> For spdx
> Space instead of tab before spdx tag
> 
> Removed repeated works
> the, to, two
> 
> Replacements
> much much to a much
> 'to to' to 'to do'
> aready to already
> Comunications to Communications
> freqency to frequency
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---

Applied to clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
