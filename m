Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBD7C5DF9B
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2026 15:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Olxg+goQ2qmWEYeaWz9H/WaucBLF4YIVlQVEhPWOIA=; b=4ZhE6NTJIJbpws
	IrWYjXyT6TGEmwDYKGasTU3P57x6E9A2yzaKMc0NLM3gDVlrwp9n3zCml6CWxKO2+EqhS0rt4FT9i
	RoyemYfMp+WEz5TujkmJnjdKoycWQRYCgnkz1dMEx2B9hFp+/Hm+DVl+uv9F07um8Hrr7fnBkVAPl
	GnvtOltb45EcupXvLMBeyhgzOMuWq3sjdmK7BeGEHSlPRna43VbOq/scQvIwDc5ZByxQ3T6/W5hml
	oUG/tyT4cVd+P/BVnxBryo3nzwkr8k4TkBkHFh9TNhxyBhn8pibGk9aq6LWcZbBHQFR3IGFIsCa5B
	2mC7amdYyUaKG2CoWTJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWW4-0000000GugV-3ZLY;
	Mon, 24 Aug 2026 15:23:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWW0-0000000Guf2-41SM
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Aug 2026 15:23:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hDfbqGOe33LfiN0dznJh5Z23M0Lr3/BSZqPKm5UAkFI=;
	b=H6enZLbHTx5fwk9ZHtWF4ZSwIjE3pouyUNWsjHjQtG4tjwZKVeZkoJs/Sr5IGM7QMb4AHL
	T7d8d1rIfu2vktsVa+AiBE7g3/xwTL3fCZ9dWm2VacITOwWzah+hSUH+ORTxxFAh30J7l7
	G9ta720/4+p4NTobbj1ZEFO+GK2U7Fo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-UzzmeCPNO2SuDHJMJihkiQ-1; Mon, 24 Aug 2026 11:23:10 -0400
X-MC-Unique: UzzmeCPNO2SuDHJMJihkiQ-1
X-Mimecast-MFC-AGG-ID: UzzmeCPNO2SuDHJMJihkiQ_1787584990
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e63df032bso634785a.0
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Aug 2026 08:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584990; x=1788189790;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hDfbqGOe33LfiN0dznJh5Z23M0Lr3/BSZqPKm5UAkFI=;
        b=HArGKPVBT+turcuSWncrBAHGgeigOVuxNP1OTHPBOrUJUXlbBHPdGA4C1kN4SukYJs
         xpDvX+vDsHjp6O/s7jiKMs9vMK3jOGdR4jC1OOxxEVTBYOGkjqOgWHCYPXdaxXCY2FsE
         8CTnh7HVvhdGHRlii5wPWlnJE11LtBQE90Y9roFoWSbXWz+V54cG0gYvaBa35dJ4OF2I
         +ZdKxIx4HNZwePKPKEYTgj0OLSB8uTtwUAUMKxEAWRXKV2JtEu0EnPlPOnrUYGorFi/N
         rD0aXO4W11y1nPVytTUbFXMCmh7/RZ/I1gpqMILJbuCCaxdBRdhonlgCMNacafqk0q6m
         4xlQ==
X-Forwarded-Encrypted: i=1; AHgh+Roqh1uiirkTCJeYi7CStt1mxnkRG8zODu3PkptYZFinbr/IQQAUe71KFJI7L4AC86JCk34UggmjdAsO+GOT@lists.infradead.org
X-Gm-Message-State: AFuF++kLffH9c/Yke4GzmoO60zLThAYguUpPes0PBsu6rJaEL7JDLcvx
	Fu6ft8kffl+LRYVq5vi3pJL1V/p92FLQjTbuFr3YfcJ+mLnpp0/nzUfzE7HPI7hfdnJyfoMkiFz
	qp0FHqTQM2yEIdIAzlVnl5bHBwdoXbo54rBYweJ6+RWxRUL/V91q1ee05lw3noJGf+VHXejZn
X-Gm-Gg: AR+sD11P8SRvJXG8VzOqNUVCx7pA0W63RcYVs0no+pJROZ53IgSGPLMw1ViERgHS9gW
	NUnMiD9hviHR1FlWYlva6oIVT7cbo7WveG7JF6THjn70GwB3PgNJcgFxKWmSvIN0oBIdbHjRrJL
	feYJEAsCU2xFls3XFpNXzvo/PnG/o2QHYql2w3e7sSLgNjdoNowsF6NNPwqYuzXewnCipyUGvFL
	mqfzTqqpmKNALyf7ptJF5CeAidNu8PGUcUJEXl1/CjL9Fr7zfiLyLBEhaoATrsNtZPO1WhYBU5Y
	UJSvVN9f1Fxa4Ebe74O9X3Q8bwSsBwI0ATYUp/rR0Qf1MAHmkgK2JV73VIOajmP64JqCQyRydWz
	rVx6QrA5Kva9WxF5/L1vPiiX6/yP+bfPD+to=
X-Received: by 2002:a05:620a:8011:b0:915:5216:e5bf with SMTP id af79cd13be357-937398f7702mr2565549485a.22.1787584989911;
        Mon, 24 Aug 2026 08:23:09 -0700 (PDT)
X-Received: by 2002:a05:620a:8011:b0:915:5216:e5bf with SMTP id af79cd13be357-937398f7702mr2565541085a.22.1787584989359;
        Mon, 24 Aug 2026 08:23:09 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749e9f94bsm517466385a.37.2026.08.24.08.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:23:08 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:23:07 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH net-next 0/3] net: Make sure clk_init_data is fully
 initialized
Message-ID: <aoxh2xyb4sQwfHXC@redhat.com>
References: <cover.1787240118.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <cover.1787240118.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BJRQiHV9szGTDfgFIDJEDFsXu--G2dsGNDUNkuyT7Jw_1787584990
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_082313_811837_9B759A51 
X-CRM114-Status: GOOD (  15.77  )
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

On Fri, Aug 21, 2026 at 12:07:29PM +0200, Geert Uytterhoeven wrote:
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
> This series is the networking subpart of Part Two, which fixes remaining
> cases that are currently harmless.  These are still fragile, and may
> cause future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Thanks for your comments!
> 
> [1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
>      initialized (part 1)"
>     https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be

For the series:

Reviewed-by: Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
