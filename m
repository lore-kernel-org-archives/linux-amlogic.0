Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42883CD37BE
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 May 2026 15:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2dfv0e+x5BwgdUfzkg/kUXG+dKm5wdDPVi3uNSCR4fs=; b=YZ6dnUJyO+/KcZ
	k+Y+b7p9heH/ffM6y6MW0v1XJUz7q2NurI0UQo2vCLkB3x7tlKBYJjr+nnLMKWoWXgK0bdmSK1mqQ
	EXC13hxZjKYvMQ+/b6P+o86mJ4FIPpRWem+NG6+ZtcNzmA7+RbDEmmdptJzc7fsZuwiIKxo1BdIE3
	o7f6OqkFDvFXlYVRiYdQgjLSAfYXwBUtRxgxgfJrNJ+Q98gyWjKmVD9YaI3r0ykEkvuyMAoZBMApQ
	ol08xrvkFU9XzfUHyTTySj0qnx70Mpd2GzsqJNTI1A6U3kVUNGaiSYnxvWV4tPe3U6pGgriixZUWr
	QndqHwsIOVuhc4czk8Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSTX-0000000E2lU-3qtV;
	Mon, 11 May 2026 15:23:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSTV-0000000E2kh-2dHE
	for linux-amlogic@lists.infradead.org;
	Mon, 11 May 2026 15:23:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778512996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=omy4WJN0/IH2ixY6PVE8ad6VlcN2e6pibSMeSb5zsMA=;
	b=AnwW090ba2dfnfam8rbWmx6D2eLzmpRMA3YSN6AdiKz9waLZ9pwwtN3mlzBOgHbELpsa3T
	1pR9T5OFVs9GnaVHgI1v1TJWnjHFXucGPPdfO5M8+1fdYC/MsWWKTDQScTDjjdlFeGpt2v
	fowuHfjrHYcTqvqOheJVYC61ckbV3vQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-5g3DK9cQOkOMuUopeeLT5w-1; Mon, 11 May 2026 11:23:15 -0400
X-MC-Unique: 5g3DK9cQOkOMuUopeeLT5w-1
X-Mimecast-MFC-AGG-ID: 5g3DK9cQOkOMuUopeeLT5w_1778512995
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90c991bfcc3so41529685a.0
        for <linux-amlogic@lists.infradead.org>; Mon, 11 May 2026 08:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778512995; x=1779117795;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=omy4WJN0/IH2ixY6PVE8ad6VlcN2e6pibSMeSb5zsMA=;
        b=NC+wEyJRM/cdtRXFk47Ld9WpD3QRHeZg9wgchDwlzM5d+yEtAX6ds2VJ+WLHv0FfBd
         V8+Tyf/Wp2JjRyyPptSPnWrrhuXYwaE7Efcbww53imOFIakQH8qMBMx25AuQ1gR2x6nS
         IEgjgOBA50Sqoh3VvHcpq04NToNikelwsDaDc9vXvfhpH5G3uWyhbiiABvKqtVLY+V3f
         SBDHOfXe6c3Xu+XgjOn8N6fgugYVmouVctqpTFOb/qDdbz/92lNj5waU0dcp0mf0di8x
         emJSu2zuu7lMjawYQk8gLiYIQpSCMpD0+LqZpgH9M2ES8ReikxwQ3eoq5g+uAARydu41
         F72w==
X-Forwarded-Encrypted: i=1; AFNElJ9Zt3zm9+i5Su06ky7s7QcvC2JAuU9sLWA/YNFLsbl/D0nrS0QtpidTy0obKupJ3UYKkUM50UojES346/iB@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwn7Sx9zUEbRt0m+on83tFQ+9v/beVOVsNrxXsk9nPqCiJjWD1
	15JhktsDQxWI43qrAu1YKprYAQe/6DZEnLuXlR6ECWb8lhY7rl2HLeeqwXobOrGbMF1zX3pFgTg
	gp83unL5RXGCv+erbty7k/3XB9acj36wBrpfKm/Pb6gIMFTvurPKwB2Y7fQC9KLYtwejwUOHK
X-Gm-Gg: Acq92OEeSQyclWta4wG2Bnlr8E6CEJz1h8k20xo+ja/vIPLIj6lNwioXBGT3RhSllMA
	qvPzOvIO4ooQcClsrFyI9yS6mU9desycP2cdfHE9nWtNnFNc9FmBtAHZXVz5hI7SkCcc+mJtK5B
	qpqi28BdXtiR/luftZoQxgMkrCNBh81CGC59y04BjrDcWTkAC6EGeai/GB8pmKWWuDFOdRe+a7H
	TcsWpSQySFot46g3qYmBQBHDhqHUPoTc+AEDbmOn1Oi1nG1M68+rzF3QpUVEpH0ws7xDQVmA9Hc
	11fMe4FMYFQ2JjOIiR0l/RcX3X5RqwJ7vgEkDujKFdSPjFMLfC9cdAS6jZmDwSNHJwmxCInRbac
	cTIuOXCkNIL+mfs3zX3gU7piJtD/zcXimBGOb0YWoY8kQgiBlpaJRpgaF
X-Received: by 2002:a05:620a:45a6:b0:8d6:6db0:88de with SMTP id af79cd13be357-90653728e7emr2602270185a.44.1778512994913;
        Mon, 11 May 2026 08:23:14 -0700 (PDT)
X-Received: by 2002:a05:620a:45a6:b0:8d6:6db0:88de with SMTP id af79cd13be357-90653728e7emr2602263885a.44.1778512994300;
        Mon, 11 May 2026 08:23:14 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b87c02fbsm1151478785a.25.2026.05.11.08.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:23:12 -0700 (PDT)
Date: Mon, 11 May 2026 11:23:11 -0400
From: Brian Masney <bmasney@redhat.com>
To: jian.hu@amlogic.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/10] clk: amlogic: Support POWER_OF_TWO for PLL
 pre-divider
Message-ID: <agH0Xy0hD4MHjP7n@redhat.com>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s_bD-LcSbdkrnyz7-qnB8uPuRUNSr_kgDmW3d2sMn5c_1778512995
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_082317_732087_40DAC1F7 
X-CRM114-Status: UNSURE (   7.72  )
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

On Mon, May 11, 2026 at 08:47:29PM +0800, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> The A9 PLL pre-divider uses a division factor of 2^n to ensure a clock
> duty cycle of 50% after predivision.
> 
> Add flag 'CLK_MESON_PLL_N_POWER_OF_TWO' to indicate that the PLL
> pre-divider division factor is 2^n.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
