Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4225C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Mar 2023 09:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GcoL8JrjBY7+Yk83qRXQN293J/DP5IPw/FC46bN6CqE=; b=iF4LBDbJAzcA1e
	nOctk9r8lLCtHJTAgg7hCKtH/Pa6uMuknck5bAy8S+wg3HtB/r06RLTWObzjbKlXuXToPMgFZvL3K
	lWZgG83dia5ZoIid1BtYCF0Q4w2/D6yJtrrce/6c0UShIbMwvt8x6KY0XJasgZdaWBmKnuSNFBGs8
	vYwFUG3/vZgSUs2yXbOlwKUPQ1ANphK2qP7tbEuTddpfyufmicCNniBzPn0jIlT6ZjTcikxfjsWjp
	EKQQcj3BbcZFspHy2Fob4b9tlNWkXiDDAIjhNs9n+S2/aQSCwfYpAMljiACrtxk/rG5n0H8HPcGb1
	XPwCd99Zl5iLW5XnyI3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peYfX-00BwKC-0d;
	Tue, 21 Mar 2023 09:52:39 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peYfU-00BwJ3-0A
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Mar 2023 09:52:38 +0000
Received: by mail-pg1-x52b.google.com with SMTP id z10so8194297pgr.8
        for <linux-amlogic@lists.infradead.org>; Tue, 21 Mar 2023 02:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679392352;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3kX+a3qX70gDW/sRmJECpI+SbkCmpJ7AHS+lpfkXrc=;
        b=MwZfTXpLvQD/0H2VRFADWwvrOgGNjNRSUsGK/xJzzEwaWqDK25VFlf9iOR0/JG4esq
         lv3Xgd8Mtri+UWS4zzCljcizT7gkCEzbPK/Oi7BqUzSngbZ1yiQfl31fxM/xPo8jGx1J
         valLYDqhnXHH4OrAlj+X8pZTlYJRSSKoxUfnXPz8ARrRpmoik6JRSDHKGZjrmUl0e43E
         YjpP0PZpEjm7lNj1iqRaSjeujZvPD3kTPWqurYgYqMnEZDbGcpkXqGt7EhkAtPZF9TON
         h/JKnlkka6BtEYgpXOjpeg2OsaheJZ4QDxL7NwTbTFh6Si0AfYevAAYSStVKwGIpxgHx
         tnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679392352;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3kX+a3qX70gDW/sRmJECpI+SbkCmpJ7AHS+lpfkXrc=;
        b=W39Ew4Fq7MrtzTWqnGDYXE6SvXxwsNA2v4fnr3yKkklVdEy+hvfabWfo+eYB6sUgRO
         KkBAEzpU/6Y8wAkMcQXmqAVvVsQtADUnKahl9kB68wQqD0zbzDjW1oT+4i1VWLhPy7J9
         5800VGM0FLrJmlHVVlT9eJstoRcNMeQ+uJZnZsL/mB0ULlwIoVhPvzpTEiGX/M/Voe+u
         ffZx77xED0/k8rzS4DgS9f8ltg24bGFZE6smh4koAR+AYOW/aoc7NcqV97lBIA3utQVJ
         ZjJqfyQz7DLpvGsPRwH4RWFq8ALbaePn/ZKBsVxY03/ODb2wSPnPMDNPHWqyOHDcVwfp
         0AHw==
X-Gm-Message-State: AO0yUKVZSwWCeUzYQNQsZiclVErK0csJHOHdSK/ZmvopdnKIpucItyvl
	a4shkVlWxudFfiWiliMRVsAUHw==
X-Google-Smtp-Source: AK7set8l8FeYzQFjltUm3v4e/D0eeBLpFn2IDwYmXFiw33WAeQ3He5HzXT9vccYmxhfHduptUCglAg==
X-Received: by 2002:aa7:98db:0:b0:624:9205:977d with SMTP id e27-20020aa798db000000b006249205977dmr1464992pfm.27.1679392352621;
        Tue, 21 Mar 2023 02:52:32 -0700 (PDT)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
        by smtp.gmail.com with ESMTPSA id b5-20020aa78705000000b005a852450b14sm7801451pfo.183.2023.03.21.02.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 02:52:32 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-rtc@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1 RFC] rtc: meson-vrtc: Use ktime_get_real_ts64() to
 get the current time
In-Reply-To: <20230320212142.2355062-1-martin.blumenstingl@googlemail.com>
References: <20230320212142.2355062-1-martin.blumenstingl@googlemail.com>
Date: Tue, 21 Mar 2023 02:52:31 -0700
Message-ID: <7hbkkmwhwg.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_025236_106456_26C0A651 
X-CRM114-Status: GOOD (  13.26  )
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

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> The VRTC alarm register can be programmed with an amount of seconds
> after which the SoC will be woken up by the VRTC timer again. We are
> already converting the alarm time from meson_vrtc_set_alarm() to
> "seconds since 1970". This means we also need to use "seconds since
> 1970" for the current time.
>
> This fixes a problem where setting the alarm to one minute in the future
> results in the firmware (which handles wakeup) to output (on the serial
> console) that the system will be woken up in billions of seconds.
> ktime_get_raw_ts64() returns the time since boot, not since 1970. Switch
> to ktime_get_real_ts64() to fix the calculation of the alarm time and to
> make the SoC wake up at the specified date/time. Also the firmware
> (which manages suspend) now prints either 59 or 60 seconds until wakeup
> (depending on how long it takes for the system to enter suspend).
>
> Fixes: 6ef35398e827 ("rtc: Add Amlogic Virtual Wake RTC")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
