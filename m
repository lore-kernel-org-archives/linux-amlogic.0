Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732ACC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 May 2022 14:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CkYCiUs260f9SeXi/4rvZiICbxqFsgGK9rWX9R+CJPw=; b=i5XSF3j//VFbpR19EfQKUJj0xt
	RAFuWeWdT+ICZdMPXrL5/Up3HoPV43Vi+15IV+dEqHhpZoP6N3X1iEuneEkmuYb2ysP/6jl/INBLO
	cGs5lBmlzOXAHZJLuBizg9e5YK5jGImcAS5Gnlc13/KXXiGcoBGqiZ3lP5UzDJNFj+zrllHGIPzg7
	WVcngUt8uhaCNPL6O2B6aQAWiQIaf+Ipmx2MPb4t92duvTzQozrlT/NmQGm9Xsp6DxXhTjYh839E0
	v4BMhDljfw5+1fnQ4OC1hi062F3o+R3Ea8gW+94xi7IPZB6OhEYDMT7JFZ3HmeecbRXSxfq1hotxa
	U60T29IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqbbO-008JGc-K3; Mon, 16 May 2022 14:21:38 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqbbL-008JD1-Ov
 for linux-amlogic@lists.infradead.org; Mon, 16 May 2022 14:21:37 +0000
Received: by mail-qk1-x72d.google.com with SMTP id a22so12334967qkl.5
 for <linux-amlogic@lists.infradead.org>; Mon, 16 May 2022 07:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=SYkp+uPmoJRkmbJFApnU05IM18/pLVoWN3QSKSNH/0o=;
 b=ZC66+Owidq27ns05jJiPmJE4OaEAsqvZvTvJUJif4De2I1xhEcUZP0qICyFQW4CLx/
 OvGjMIQoYMqvVQ3txiD8ss7oFbYS+ti5TX16SKh3heKkPkh+T0RZFNIR3SjZU4JtrJ4c
 JY+DOtVvMbIjmrsWAthMg/2+Ig/AWnA9dOcqaxvNpS5UCDSiAKUd3b+Dj79o491ApJGs
 YYJsgRxigoofA8UW6dQEYJWS2dz7JyGv2UF5JWRoSDg2+Z01zid3rnnBWC0QYNeUZ/1X
 9QS469lmMLQRqsnEH4abvTIjoeN/AgbeF1AAV4fbhRg9bsQ+am2ozMiwDmDrhdr5c6WB
 xkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SYkp+uPmoJRkmbJFApnU05IM18/pLVoWN3QSKSNH/0o=;
 b=MlEs/0FWQR99eYKCxhlmgAKDhMm8qq5CzEoEL8YZ+pKUlU7Hb2Ivb8ChbgY21ydK+D
 dJxX98dWDjK5dehxv2UzwyVjUFeZC48NTYXBtXBXyN2r2jgsc6XxEm+tyQq1pEy9Hp1Y
 rs/0jEucNPmNlqtMTaywjOrgBt5c2hO8dNv8v1DjJmjL5LUgnAoRPLZPsEVxk7D4KWHS
 E5XDqvmwUo0fiDuckOJmNyuU2AAx5C4WFCzNJvIXtBkcHtz9h7Cp9BkNSS+KT0YeUH88
 6tyMz4yQY/TA1o5i/5D1ByWS/1yaasdn2aB3fJDeV3xDbXPyRKGnMeLBEuzrbEbiaJgw
 czSQ==
X-Gm-Message-State: AOAM531/Ed6qgO51Mnts7ew8dOclbzI2UbRKWmtF/ryDvPiecFIftfvU
 AakMyCHzzKJ4UO61UCzrEN5rsG8UWirEBg==
X-Google-Smtp-Source: ABdhPJzT9RD9xS2fNyDxtR+woteOFuhWHiBQzu0AmPa2pq+3knIhW4wMWjkhgBuoWgGn8qNI6gmKmA==
X-Received: by 2002:a05:620a:2847:b0:67b:9886:f6f with SMTP id
 h7-20020a05620a284700b0067b98860f6fmr12720705qkp.577.1652710892199; 
 Mon, 16 May 2022 07:21:32 -0700 (PDT)
Received: from [192.168.1.134] ([24.139.179.16])
 by smtp.gmail.com with ESMTPSA id
 r193-20020a37a8ca000000b0069fc13ce1f1sm5858854qke.34.2022.05.16.07.21.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 07:21:31 -0700 (PDT)
Message-ID: <3f9f1f85-13bd-5791-2387-a523bd9bbc02@gmail.com>
Date: Mon, 16 May 2022 10:20:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: OdroidN2/N2+ HDMI Green Line
Content-Language: en-US
To: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org
References: <ff473c04-ffac-fdbc-597b-e0bce7e3d6fd@gmail.com>
 <8a4251bd-14cc-6105-d3ea-4eed33da2e38@baylibre.com>
From: Jefferson Gonzalez <jgmdev@gmail.com>
In-Reply-To: <8a4251bd-14cc-6105-d3ea-4eed33da2e38@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_072135_905798_9563FBB9 
X-CRM114-Status: UNSURE (   6.39  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

> Hi,
>
> Please check & test the following fix:
> https://lore.kernel.org/r/20220516072245.10745-1-christianshewitt@gmail.com 
>
>
> Thanks,
> Neil

I confirm that those changes fix the green line issue.

Thanks!


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
