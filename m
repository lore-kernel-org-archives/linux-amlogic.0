Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCD0C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Jan 2022 09:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWX7QQtis9bvmmBJQrQGqsWM5mDdCjN3qt8YZvChZyQ=; b=POTSgJKIt1r0sg
	nIIvDsB/w0zYEZ/DGLuJnnqwv1j54nuWZG6QrIxnFVFJ7wEZf3iffQ9UAb9VrzNf4V4aw0PsVILEO
	SFdnvl8Jhm64BF4/tfkejSjzbpch/Gi7gAnDrInXqczjNRIaVZCPg26ivJw1ECDSCjUCmN+OB74KI
	tCn3rvd8Nuzz1siUYJKTa3NcRsDFzC0Bj3sWGDlHG5eNts5hQSzeaFXxp89yLY0uJEnPP9IcUsOvt
	Hd9UMUaefaz/mqoRRRLEWpLB5aeS9A/ovgtVhaHoqAV9csMq2JYbo23d8zWHBAtg2hYqmtyZCCNEt
	7vBD3qA1Jn4AM+VFK3kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9kuk-000vTY-TT; Tue, 18 Jan 2022 09:36:30 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9kuU-000vMy-Jl; Tue, 18 Jan 2022 09:36:15 +0000
Received: by mail-wm1-f53.google.com with SMTP id v123so26256197wme.2;
 Tue, 18 Jan 2022 01:36:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lta+WiuGF7fVL9x+wdfLW8Dwz6jPkLm8BCBCGdScuOQ=;
 b=AhV9JH4iC0ZI1+igFGxY2bdYs17v5GQQTxGmtY8X7dWK7P+/jpip5ZPw+xGMhN2bQg
 7T2AF4Oyw+R7za6WtE6A/jH5qoLBH8huklr/rmQa4uQiFNQmiFvSqqtjvdvp1jY2nOvu
 vmzRuo+ygJnjG8ziT3W+nvTI4PHioQiI5TExntwe8c7zEalCvdw11yGnX1ENizi9lJ5F
 q9RuoXl8dmtwYiy5QiIFmLh+YKhMozZoWi7yyUhg5SOVr3HF/cZYhN/HZVvdohuHxE5c
 Bd9pqqIo4PlZUAN2fklvfwjBimdUAzZNEqItRGVZSz0r1USQEsVcHVhvupjnAXmqyjiM
 LnaQ==
X-Gm-Message-State: AOAM530aSlaerr1ilfzrfrK788QIUNSiqO7BZica2bc/j6PkdDU8EUn/
 F3MRD8aujakivvZsEIyNEXc=
X-Google-Smtp-Source: ABdhPJwfz5XfSzdygUoU4zgOvnVdt80kU0t1wt1KF/ylE/SZrny+8imsIAGG4/JngREUP8gG00Ej8Q==
X-Received: by 2002:a5d:6d04:: with SMTP id e4mr5456617wrq.406.1642498571862; 
 Tue, 18 Jan 2022 01:36:11 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id l25sm1730544wmh.18.2022.01.18.01.36.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 01:36:11 -0800 (PST)
Message-ID: <97dfc8b2-fded-01df-44e9-b24988a76d54@kernel.org>
Date: Tue, 18 Jan 2022 10:36:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V6 2/5] tty: serial: meson: Use devm_ioremap_resource to
 get register mapped memory
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220118030911.12815-1-yu.tu@amlogic.com>
 <20220118030911.12815-3-yu.tu@amlogic.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220118030911.12815-3-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_013614_689873_47CD34FD 
X-CRM114-Status: UNSURE (   6.84  )
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

On 18. 01. 22, 4:09, Yu Tu wrote:
> Replace devm_request_mem_region and devm_ioremap with
> devm_ioremap_resource to make the code cleaner.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

thanks,
-- 
js

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
