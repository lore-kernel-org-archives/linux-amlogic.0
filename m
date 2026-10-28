Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83B7606A31A
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2026 06:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VYl2OZIA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uvC00cRL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZM/VkD+7Z11Vvx+a5wD73SAbu9E8KUgeDRC12L0fu9M=; b=VYl2OZIAIwlbbxpXi91H5/EaH+
	14Rk5+1N7NxALZzKqsO0eFF+Q1cXHqJRZsYGJGAzwlmVtUuDwe6IkEg+KeELBRGbjPb4oL4YZA20b
	FO6M8uJqebnutObBdonOdwk2H3fJui3hf//4iJLw8VvDw/yVi7cOBiepiDBOarZFlrXcCN5Ewbq0G
	n18klNFwgiFAsuqGJEvEXo2lerri0TyFRa4r/1K+jwJDO0za0vLGL5YWaribFQcY/5giJZ0Jp9HdW
	/teMlAYqIY8R4AI6+Hp943bGbCOq7iSruBBe7U2qdOeW5YDcMG0jNZfFpc8xHXMqmRWmUCGEtCf55
	TOOl+yiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLwxS-00000006Olk-2e1C;
	Wed, 28 Oct 2026 06:16:22 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLwxP-00000006OkV-3uPX
	for linux-amlogic@lists.infradead.org;
	Wed, 28 Oct 2026 06:16:21 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5ba35c0df4fso676833e87.0
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Oct 2026 23:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793168176; x=1793772976; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upb2yDjK+Sz2Or79oIRzVU6fGyWUl+WecZ9r73Zp7qs=;
        b=uvC00cRLXCAUX2Ltx5xaekUZscjxsqssy3OCjz8blwEi1ZAPP/5P/yJeIoVjxrPp0W
         IHX6XUNj26+xrKJy4XLyUwkxgpeWmaWFzp6O7EtX0wKe4IIm9Ha3/QGwTSRkxtcjkJQy
         uI/eGSYaDczxHOEKKVvcQ7B43c8yJNkm7mgXO/v2ID+mta0/gIKrtVEwFcLzoQQv+OXd
         bpjqkzMswnDkksTHXfa7ZH/bMDSxjNEK3hDVbAbEL35sAwKAVpTCjIFfQJVOP/XqXffG
         y265bVi+N16hRua2cd/ynwyol9D1xockckZuO3FzeTuqjnFu3IYNxRp1I27QCbEKXdFi
         x6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793168176; x=1793772976;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=upb2yDjK+Sz2Or79oIRzVU6fGyWUl+WecZ9r73Zp7qs=;
        b=M/nlRMFc936uKOVH3ZI0tOEKu5St8ErTQa7evpz7oqJZneTBkLeFZqfc/4qsow0rb7
         9uJlsfqQy8nV21b8v+0hsQVMUht7jKGJrqlSofUqQjcm4Tgmv3p6U03Fe6jFJ4+7IyS8
         lRVrfivYNgZAVS/MIL/2Rm35z0jrmh1rvG2l7iiXUjRrmpfjcv8jdb+diyZLdM22xQOD
         2tBi5CbUlkWeNoepNhDqth+l12BhB6iu3GtSCpsRJlVtAGsecXxReahdN8vUD9Ycs0mv
         bo0UwhyB7Y+WJGk1F6MqEIYFWVCV2IcXVXXrmFHURlDZ7rHQgwzipUi3yiEjoXWDG3pT
         ISZQ==
X-Forwarded-Encrypted: i=1; AKwUvByIDzbBQiN4SWI6QvcoVGL7/n7Fetc0MZdemh5ZHWFnX4JrDbs4cskeHglw8Du1+oWCatdjOfUpMMV2Onon@lists.infradead.org
X-Gm-Message-State: AFq9FYJTTS1wZ4N/UvADWpeDjXT1FKGmamYCouFw+0KQbTmHChr9NbdK
	tJ1+nni404DQFEcxpVfx+DFW0g+GK77EO7qmU6yvxcYwdpZssqjp6k0A
X-Gm-Gg: AYBFou1AJJdWivNwkWri2IWIVPjSvG573RFfeuR6/77BummVNcNRrKPV9472liJyTzx
	WgLyV99Kz4kDoO5VptExO1/2DsmbWqpF3r/JsbLHTOCYd3np5Wgny43pkE6k8m1++W3xlefiMkq
	dEXdfaz0T4fGlJTfE65nT5ffavKAX6BcxQDDb7QmVQZgl3i8BosKtEqHEVRDPQt2+t9UMBHz5ow
	x62h8McHQla3T0YjuIO1X75ke4quLAWvPBa6um3CqEuMUVDqaY5g7Sv24aJuzk4OPHJ2WJ9rbnw
	vgA9KErM3ODh02xpVt74EDAWjE8CQ5RzXCa2cZahpFNeMbakOIFPrtHHtXiH0vpw2DVSFyJYAPG
	g9Cw8DZ2AT4WCGcP63dgwCHBDIuw5FFPWKi7pjVFJHaYDpbPYK+UfSonzW4wi7bxjQg9pZi2TFW
	h0Qj6qpTkElQgwGNO2Zj7pyCaUGVqL++pqLlcDrCK339p7OH1dpPPurSfA6JuyzF3FhsW5UKItZ
	Is55qtPk+6PV2uHRyFK75Ws8BZ7z8PM6u0Uk1PQMU3qTRVZgOMiP1Ku6TXRMs7I4LMhPldWh+OJ
	XVAdyg0GMyD4oZmOfkEnaX1VnUqyja+DN0bxJRRE42ODesBFLEx+gNLkgEgLM/cng8ldMTGBDLY
	leIhjbun1gw==
X-Received: by 2002:a05:6512:3a82:b0:5be:4be3:bb8f with SMTP id 2adb3069b0e04-5bfcad787eamr578392e87.19.1793168175751;
        Tue, 27 Oct 2026 23:16:15 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca47f9f2sm400912e87.8.2026.10.27.23.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 23:16:14 -0700 (PDT)
Message-ID: <9e9a2f4b-b6d6-4faf-95f2-e227b41d27eb@gmail.com>
Date: Wed, 28 Oct 2026 08:16:11 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] iio: accel: kionix-kx022a: annotate the lock
 helpers
To: Rupesh Majhi <zoone.rupert@gmail.com>,
 Alex Lanzano <lanzano.alex@gmail.com>, Andy Shevchenko <andy@kernel.org>,
 Benson Leung <bleung@chromium.org>, David Lechner <dlechner@baylibre.com>,
 Guenter Roeck <groeck@chromium.org>, Jagath Jog J <jagathjog1996@gmail.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jinseob Kim <kimjinseob88@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Remi Buisson <remi.buisson@tdk.com>
Cc: chrome-platform@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marco Elver <elver@google.com>, Bart Van Assche <bvanassche@acm.org>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
 <20261027124954.110697-5-zoone.rupert@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20261027124954.110697-5-zoone.rupert@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_231619_993094_8EBBF7CC 
X-CRM114-Status: UNSURE (   6.14  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/10/2026 14:49, Rupesh Majhi wrote:
> kx022a_turn_off_lock() returns with data->mutex held when it succeeds,
> and kx022a_turn_on_unlock() releases it. Annotate both so context
> analysis follows the lock into the callers.
> 
> Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Thanks.

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
