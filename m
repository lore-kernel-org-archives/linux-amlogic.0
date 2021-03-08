Return-Path: <SRS0=LTpV=IG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD20C433E6
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Mar 2021 09:51:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6548651B6
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Mar 2021 09:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6548651B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e2uCJqbNtZpDQlKjLc9ZODMKGpIb16ioJ1Rk50NAseg=; b=OcvzLFt9WPKVs+e7ipaH89pYw
	NvAULm8mkrI3fsY5rA/94bv3LbLyKylQnrc3ewxN8h+24GM7MEWfJ54iwnkPU9zLAtkTCiYqG0Bot
	OWA6R+bJuLpEl7/+hxzyzsjky7m+EHhZCt1rZCeOYcGDvtTKns2vLxE0o0gSf/9yISSo9xVhoG0Qu
	UkTnZ8ttrV6aT6xu0w9JqdAHRQmxXw3kRlOtgRZiGWoONVzEST1uZnsPGBP8NhuonKswaeOtutLug
	zsA0SwikMSQ8q05zpMLFjNJ8xGHr41HGk1PHE2BNi8ohFHQtX+xBdeVn/c/sSmTOyqbsTjODh+TG3
	sWYQXPw1w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJCYJ-00GH6S-77; Mon, 08 Mar 2021 09:51:51 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJCYE-00GH4l-Dh
 for linux-amlogic@lists.infradead.org; Mon, 08 Mar 2021 09:51:48 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 340B75C0097;
 Mon,  8 Mar 2021 04:51:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 04:51:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=A/ZAbF35kVJb0O6ltOTEQLBV9ts
 HExHaU0hBdQUKle4=; b=t5AOpIWYFE1NLn4Mb/DwEX6h35n4Z5JECU1IVrV8/hN
 o3OAcui7QUaIOrwpbWZGDTtByrm7ue7CxDysHoBYu7jh7VpoeTrKHOIT2V81Jr1d
 q7LQ18EqoC5A9HlhktEkArc1unwzbQwmZ5F33eG3P0FfTNbrfcJ18v5uO1ovLbb6
 6a7fspxcj1A8eDmiXI5V/FU9/CGbLQJloxrkqYXewL40K2PzTY7v4C96/IJ0FoxI
 46MwP7Q4s+JlmDNTepq4Fc5sVxRhfbmACIybVhu1bsZjupxncDZZ6uQw3IfppAR6
 9d+lO1neCVLKVHAKx4OIUZQHlwksexrMtVWD1JUh9hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=A/ZAbF
 35kVJb0O6ltOTEQLBV9tsHExHaU0hBdQUKle4=; b=XzmuYiOTVbNKwrBpaissN3
 J9n1CI3JdRCRdB3PjpJXNfmEnDiJ0zLb0rmWLUxsSjrKQBqjj/X5fwjLO5pIGLUl
 SfEgrMbVTCfzShXA1875BkThVlzP45QPEZLrID+zMvPpvVE18Vyl4dwbPXHpKgOH
 h2IAg1a60gII+tggkzihe3o4g8P70ensq0v9m1lxdjli0XrPu6YWNEF5sZ69trVG
 mAjzZCoCri/sQ1q4Y6tTLuR4q+51DuA4PMx0GX8jqOiy3DrUomdYIcS3cGNGLMDQ
 RRdIxylg8cKCs4MQxpzNJUXwbzXFeI7DzpI8MxUUhVS58ozSohN/gfA0m7+CbqIA
 ==
X-ME-Sender: <xms:rvNFYKBYASs5gf0NgKO5El8mdvv-ZFAm-fJImS8ktATI16wQMCabSg>
 <xme:rvNFYEiYqEAYP0dl2tzzcP-bwRFfwmAdhd5BhS9Fmx4rPxtPWVvDs7IwCLh1qLvVZ
 1w3TBA3uwoqUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
 fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
 rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:rvNFYNneWcoQrcw5pL0RJT1nHttVAjJeIsgiIq5qi9vnDMt7q_bGZg>
 <xmx:rvNFYIxEasl6PoDnwUjP9SkjNTTyN1H5UiahAZ1Xm4q922kYHOOl0A>
 <xmx:rvNFYPS7KBHK8KQPG-FABCXuudZz_GhLD2fSFsWMSghoZD0YYg6y0A>
 <xmx:r_NFYJcxJGInnLiA_EQOT38ZUyeQ8m3vKNSPtjGHrGzpYKwfFfNwXQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3EADE1080066;
 Mon,  8 Mar 2021 04:51:42 -0500 (EST)
Date: Mon, 8 Mar 2021 10:51:39 +0100
From: Greg KH <greg@kroah.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: stable@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Corentin Labbe <clabbe@baylibre.com>,
 =?iso-8859-1?B?Suly9G1l?= Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH stable 5.10] Revert "arm64: dts: amlogic: add missing
 ethernet reset ID"
Message-ID: <YEXzq5EUM/mcLY9L@kroah.com>
References: <20210308092241.17058-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210308092241.17058-1-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_095147_058363_09BED4B7 
X-CRM114-Status: UNSURE (   8.66  )
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

On Mon, Mar 08, 2021 at 10:22:41AM +0100, Neil Armstrong wrote:
> It has been reported on IRC and in KernelCI boot tests, this change breaks
> internal PHY support on the Amlogic G12A/SM1 Based boards.
> 
> We suspect the added signal to reset more than the Ethernet MAC but also
> the MDIO/(RG)MII mux used to redirect the MAC signals to the internal PHY.
> 
> This reverts commit f3362f0c18174a1f334a419ab7d567a36bd1b3f3 while we find
> and acceptable solution to cleanly reset the Ethernet MAC.
> 
> commit 19f6fe976a61f9afc289b062b7ef67f99b72e7b9 upstream.

Now applied, thanks.

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
