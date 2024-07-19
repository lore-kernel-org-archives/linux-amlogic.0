Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAC6C3DA5D
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jul 2024 07:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MY15hKSD/jGONwSTX4AQXGaF3DPQ3HrjUVgWeqkJg38=; b=gMVGOZK4+WTl1sNacrp93C+xW7
	FuADRILi9bmNqY16ez8DEvuyMSl/oJe9TacjlDTjNYMUu1E1BpsSTZZKKL4LDCtLgIWjFxAw1selF
	JQBrScncTUGtz+LU/+jwPceG9aFU24yFoOvjWk6QsGeJLKTtxBAzHjaOMwgV0608fWZl7CGdyO1W1
	eoHpl7SLh/jrL69C/TstRwc04cv9hK60+h3Lgk91aHPJ5Axare9iaDOBmSlRZnKfsc+qa8IL3b1Xj
	Ui8ywEaU11Vg0h/5r7DTeo7UaO7HcaTN502avn6YYoQ+qRm7LQlt8XOphiLSyVplzjClNhwn0Ejut
	N6KC4Xbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUhv7-00000001u8K-0Kqp;
	Fri, 19 Jul 2024 07:20:49 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUhv4-00000001u6a-0OH0
	for linux-amlogic@lists.infradead.org;
	Fri, 19 Jul 2024 07:20:48 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5a3458bf989so228707a12.0
        for <linux-amlogic@lists.infradead.org>; Fri, 19 Jul 2024 00:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721373644; x=1721978444; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=snCOMfSAIZ7BN7SEbXap79VN++oHgdcE3AI+lBWfejI=;
        b=GcaaMwkmymU5wNMLz78ZmXDhH/VlCy4IZrKV5Mxa1nfG9FweJH3bkKF0OfXYl1vHzH
         77Mw2RBpohuMzqCTGk61q6a8srYQLXkAXNUbDYfOqE2aWhn3zkX0L08jgsSwpEcl1jip
         52jDvRYnZ+EzX8wONyNSGU6/9gOGucsQLGhpjEW7/doBz9kv8m9KZBa1VeJlqU3VYy49
         54gNWFGpDHjEXdsCRVJa+TyCu4k2bChFzBQ0MA0HuUdJ8wHXyUPFZf900nuBj97dkkQc
         ZOipDgYCWx+ZH9Qd5uK0Wea4kueNevXlwMJI2CE0kNrFUnZFSmLtqic+XoB3QI4imAGM
         1BmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721373644; x=1721978444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snCOMfSAIZ7BN7SEbXap79VN++oHgdcE3AI+lBWfejI=;
        b=CW4lrukLjFibv/nygUgfmCRtyDg14cp+fU5vLaGPkliRzPj4HgwN0JE4V2Kv2oXuP/
         LVu+iPElBnHa5kWxFrIRaj0Eh37QilAAItwtG1FOLXIZGUST1EEEJYbD/7ZszJSspOOs
         jdfyHW6CyqmwIL/V6I/55BEkQZ8JzI5ZYZhkSWx35ZWpWWsMPQotZzEaEEjpTvcwLMga
         J1pKb0b57U/xTMqulmsso8OhaxbNuftvxFNFq739dqZ/UgE3hlZWb24AsRxGpWo5PYbi
         udgIFa4ZrZkGrW7YgvUE02AFB1/1lnmr9GC0yBYSgG6vLl/X0QFlCqXkg0pFOA4d6re2
         RbCg==
X-Forwarded-Encrypted: i=1; AJvYcCVUUvJHMkxHdKQNuci7MZncsl303HkVOaT1Fc1rn6v0ni1xY4RhpES0XPuvtLWWjN/7Nbd/r+AAFKh6sDm4eFRyl4K78dqyLt8NjQ8d5xnHrP4=
X-Gm-Message-State: AOJu0Yx0fcGU81AeLdyuto9C4zkM/18oeRrMTlQJ0eTVjpKqndQxCOTS
	s9Oey9/+hS5/DvtTcRImXNnlIpruhrEwQ6Zhxokn+9UodkhXCiZJzlgP8nRi53Y=
X-Google-Smtp-Source: AGHT+IHSnMJiPqKXQFc7TqXz25zzG8NVyoXNnDQ32Bkv6V9d4Cr9qVr7e/wI2y2FwvE11QdoZJJXTA==
X-Received: by 2002:a50:d682:0:b0:57d:46f4:7df5 with SMTP id 4fb4d7f45d1cf-5a05bfaa613mr3897320a12.23.1721373644032;
        Fri, 19 Jul 2024 00:20:44 -0700 (PDT)
Received: from localhost (p50915eb1.dip0.t-ipconnect.de. [80.145.94.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a30c7d30a0sm669323a12.83.2024.07.19.00.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 00:20:43 -0700 (PDT)
Date: Fri, 19 Jul 2024 09:20:42 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: George Stark <gnstark@salutedevices.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	martin.blumenstingl@googlemail.com, jbrunet@baylibre.com, khilman@baylibre.com, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@salutedevices.com, hkallweit1@gmail.com
Subject: Re: [PATCH v4 0/3] pwm: meson: add pwm support for A1
Message-ID: <bp3hbxl6zs6lwomfdj6edhq35pde3gr5i2qizgdf2varke2eai@weeodo6gacd7>
References: <20240710234116.2370655-1-gnstark@salutedevices.com>
 <52e2e211-a0b7-47b1-a451-34c304028097@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <52e2e211-a0b7-47b1-a451-34c304028097@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_002046_142231_C399BE90 
X-CRM114-Status: GOOD (  10.45  )
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
Content-Type: multipart/mixed; boundary="===============7908304845380189668=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7908304845380189668==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a4mrqcrkf7uvtgvq"
Content-Disposition: inline


--a4mrqcrkf7uvtgvq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello George,

On Thu, Jul 18, 2024 at 04:09:04PM +0300, George Stark wrote:
> Excuse me, should I fix/improve anything on this series?

The known issue with this series is just that it's one of several patch
series that I didn't come around to review yet. I tackle them one at a
time, usually in a FIFO order as listed on
https://patchwork.ozlabs.org/project/linux-pwm/list/ .

Best regards
Uwe

--a4mrqcrkf7uvtgvq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmaaE8cACgkQj4D7WH0S
/k6nDgf8D5F2Na4nH6HLwiqFon8plnLTpbHNktSH8KoKVdGii8LxI9VwSaFm625x
7TRIUvuD6Ss2nW8Wyy5XN+Jj7GjFT4l2A6YOTtbPYqpnAKryKUPmu5QPFLE/UrH6
HqoABIBLJsFFFFLHN8DSJm6EwHOLyfqmhtYt3ReQLYvu9flXIht4E+JCUnZSrxRM
dw1WSK1yJBMhDcnIMcFZ48C+ymj4t3bzImEt8mjoExdlFC/sUzsZr2853Dme9QJk
Gqi3tjsgTHFBMq1CpjXdJNBTnQaqRECKVvrEntWW66s8ocdF4Q5Ib3M8TeOY2WLg
EpCoY/o9x4O2xTSQ0Y0C7kRbNln1rw==
=tWvy
-----END PGP SIGNATURE-----

--a4mrqcrkf7uvtgvq--


--===============7908304845380189668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7908304845380189668==--

