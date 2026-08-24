Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A565AC5DF94
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2026 15:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vMJimcSx7D97r1A3/fWpMoYfSpMjKAbvX+wqY2N9pWM=; b=KNFNCeek43fcr8
	+YmVGA2J1zWbFNbln7Rp8WzMrL8OB1jBczWo1c9JRrAjW7UKKNvxLggp7xjU6/D40v1c62zilwSe7
	SDPKdbzOiarX/sEMDsgsv7xhQF4EpBTfWJVgdWYCMCknTWFmJeTlzJH+yBzBUnAefwyLVQSpSvm1r
	Elh3WlW8KW8OyHEwKeWyxDhYA1iwLY8EttvXQUBUZfyF233zhhWFlGMyZ2owWMWE5YeFDZJ8cQOgt
	kD02MHih3GuBJ9SMg65a6h05QuXjlR6OWIkU5olXYTIS3ypdTskcxb2R/fIULXIojJ5spcUoF5bmB
	ZCBGmy+a4tjEFhMSwvtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWSy-0000000GuAl-3pa9;
	Mon, 24 Aug 2026 15:20:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWSw-0000000Gu8v-0Z2R
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Aug 2026 15:20:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wMSWmiH1cJai0IaGDoQ6OFd5v1bPfnDOVCJrWuwjf80=;
	b=LeoM0iFDJo8NWNziD7hM78sIEYia5w7TwqxaNou21AovXxFC1Dr/xS9Qc7uDDESZYbvdMz
	tZenoRNFbGH8OJtIblr2IYonChU2kPiXiEv6kXSNCmLEd1sQVOIBmNpnrQQdHRBH3sWr5w
	f6Dyz2IazZiqEJaslnmTKDOL18nOEmo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-wl9bYHeVOOqpLFFjyCHnmg-1; Mon, 24 Aug 2026 11:19:59 -0400
X-MC-Unique: wl9bYHeVOOqpLFFjyCHnmg-1
X-Mimecast-MFC-AGG-ID: wl9bYHeVOOqpLFFjyCHnmg_1787584799
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f08560ea44so36552266d6.1
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Aug 2026 08:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584799; x=1788189599;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wMSWmiH1cJai0IaGDoQ6OFd5v1bPfnDOVCJrWuwjf80=;
        b=TzWxbd8qaH6mRyWuctSliJLdnWDd7XXXUeLF3T5d/iwyrUgnxh0kj9i6shf5Tl2ujq
         egmgZ1Cxhw4vFkUpvQoq9kG9raFaXzFji3s2qLctl+o0wFf5wRXwj5yOzCN57327ZNsZ
         nih0lkDwM8C5sRVfN7axfwWixVdxyip/iMdFMp4mNiU0oFtH1ciUW2F6haNVXY3xUyLP
         s3asUmprJEorSINzNSK/t1f0rojjgLPRwpCAE01WcX+tqMSHSnkHyoKU0WF73E/Xk5CQ
         8zGkXBV2SZ26T15j1HT8Vn/yh9Dmt2/+YuZh11JNMaFAlW+npefBt98YKtWG9PtpkSFS
         VcYQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3D6VPldjK8acOkdTlTRuXa7UnAE57GtzJHpsRFCS8VzwNwWMwJ9U8q2SBIejPqePAsI6x4XVCBAGMhjYF@lists.infradead.org
X-Gm-Message-State: AFuF++n7VTYWQG3ciuRjI7vyCiRLmdUnBZcig4IVzxT92jQZisDJL5zk
	1cRBLxcByIMENIuO6Y6iA7KavFkr/gCbZgvr/q+2Uzy38c4rFm1mtf61r/vuPbnpreljkK2FSQY
	6EUZONs7IyndeN06c8vAUEgbFPeyRl3r9+4fmGcJnCR7Yp/mmsr5qp1Cs459VRrtfEZrX/mbeHz
	wojrcvO68=
X-Gm-Gg: AR+sD11cTXXCxb7Hf2nnaZEAbxghs0grMI5jFusU5LM+ZO/gFTvtmtFiFhFXh4We11z
	pfjpelCBHViMIxD7yxA0Ny0lZ1zatToqrzA98OsM9G+BGSAHN2hgsKC52rG0eRFSDCLjhyEtE28
	Lcojct4EaZwv+lsVQUdRIXN2A59JpTKxhLSwGkgjy7KixAT38oKH1drW+F8pXdYftKFlfKa+f+P
	KyGTGAWk9vaamqYCMGINbzbS8ledKWqNuCeGJSt3i+MNHhY5X2pnfV2khU7rLpTgIwmGxhY1g+T
	j9jgEWD078mg5MBHWgtYuhhzMF0ATq72muIhIjiH9OLv7I47OW2DSMgb6ZWR3lFqbXfEtjpOwUO
	OM9T44z68C8WdQ32/A66NBLaLbRJ/w860PEo=
X-Received: by 2002:ad4:5d4c:0:b0:908:98fa:f374 with SMTP id 6a1803df08f44-90c8094440bmr304531266d6.6.1787584798993;
        Mon, 24 Aug 2026 08:19:58 -0700 (PDT)
X-Received: by 2002:ad4:5d4c:0:b0:908:98fa:f374 with SMTP id 6a1803df08f44-90c8094440bmr304530556d6.6.1787584798413;
        Mon, 24 Aug 2026 08:19:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c93931452sm64597986d6.26.2026.08.24.08.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:19:57 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:19:56 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Eugen Hristev <ehristev@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/3] media: Make sure clk_init_data is fully initialized
Message-ID: <aoxhHNZjrh2kUXXQ@redhat.com>
References: <cover.1787240035.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <cover.1787240035.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xhmG_zb32hh6aVFQuNqa10OKdJRC2GoDPicFxnNBoR0_1787584799
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_082002_281475_C1C5B35F 
X-CRM114-Status: GOOD (  15.61  )
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

On Fri, Aug 21, 2026 at 12:04:27PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Hence this series aims to make sure all members are fully initialized,
> to avoid such bugs, and to prevent future breakage when converting
> drivers to a different method for specifying the parents.
> 
> Part One[1] fixed all cases that I identified to be real bugs, in
> response to a crash I saw on BeagleBone Black.
> 
> This series is the media subpart of Part Two, which fixes remaining
> cases that are currently harmless.  These are still fragile, and may
> cause future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Thanks for your comments!

For the series:

Reviewed-by: Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
