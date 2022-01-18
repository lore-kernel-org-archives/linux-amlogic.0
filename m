Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590C0C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Jan 2022 09:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AzTMA3nQcPh7H3IFkEqaSfEiVKka2uj+2yR6WzNw8d4=; b=D+gzLTm0E56vWJ
	ed7tnzJzf5MufIeIXqVJxj//XzNcIAMRXE0Gb0xglhWYLBMSoYHs/LJbzmFmZsrg251ME5F89I2lr
	wYFjHMQxw21k28iSJaLA1ceLnDHR09Sn7mCsMSF3gOXOa2BAOkN74BRdRzRM5LvWPyaupAPgiiwzJ
	A13aB+1b3OWtKuKvkX2/WFJJcjVGqsPfZQ+KeVXYRViQCAGY6emB8nLBJudUV6gnHhVZWiw6GY8nT
	yLqE8N4dOXXlv19dJw5OGk3Y7KbX1RPzBefqtQ4fHGKBfPy8t+BMW7Y5+gB06GqcY7J37pP6htIwg
	c/l169il3x4eMWkRv5CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9kuN-000vLe-8u; Tue, 18 Jan 2022 09:36:07 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9kuA-000vJh-So; Tue, 18 Jan 2022 09:35:56 +0000
Received: by mail-wm1-f52.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso4314507wmj.0; 
 Tue, 18 Jan 2022 01:35:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yqez6OLbU0LlAXxQc+U5YEFdroOkgDkm+OsLc2FpZLM=;
 b=GtEtgfdUya9b2w+0G+3abuR9bBSHuIAWAWRxJH38Af0FtrCwNySZeO5FTT5qtEyPHw
 PPtsr77MNtYzyy4Pd2edaVge4OnOY9eKN7fQebncJEC0nOestg1ai1zOvju/yUPPLIzb
 6Ioj9YlIFtvvnJ0kmCsewl9ca967/JOTgz4qFZddyNpW6r3pl7x2G9D8tDn9JCVYXC1S
 7IEcEysSgqH9anxipEm5mdTidQ25jYooN5tKhmVj9dggI3OL2v290FFEjs6iYPsNfQVm
 N9otkG1SQJXCvzjD932kxUZ+QdYTZRJpZV43dveSsohfRi/hzkmy3W3HusJ2eI/Jv/X0
 Q0Qw==
X-Gm-Message-State: AOAM533T8f/aqbgp4M/Qt5gmBDk4cC8fmrkyN9l4Eh1PydT9ynl/aOnp
 dqqXsFQJ1xkfADWkn/S/ezc+vdIWmdI=
X-Google-Smtp-Source: ABdhPJypw/3o2cvOYuXKhhFw3KtkqwS2GkT6q7D0xEF+rhwbailgasqnqmJlHUgSlb+vYQuY3lv6Mw==
X-Received: by 2002:a05:600c:6013:: with SMTP id
 az19mr18079459wmb.53.1642498552982; 
 Tue, 18 Jan 2022 01:35:52 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id t15sm15652797wrz.82.2022.01.18.01.35.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 01:35:52 -0800 (PST)
Message-ID: <a7267804-1400-c63d-50a0-72423f141317@kernel.org>
Date: Tue, 18 Jan 2022 10:35:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V6 1/5] tty: serial: meson: Move request the register
 region to probe
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220118030911.12815-1-yu.tu@amlogic.com>
 <20220118030911.12815-2-yu.tu@amlogic.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220118030911.12815-2-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_013554_963292_5F7625A5 
X-CRM114-Status: UNSURE (   7.87  )
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
> This simplifies resetting the UART controller during probe
> and will make it easier to integrate the common clock code
> which will require the registers at probe time as well.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

thanks,
-- 
js
suse labs

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
