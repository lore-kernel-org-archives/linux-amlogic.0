Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC194C64EC4
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Mar 2023 17:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:
	To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5H/DXRT+bUv9cg726piKyQGHZn8LDGySjEEHJsmkoY=; b=DvEOAeMC5HrAbBQz/vZ+XwbACZ
	gxuolJuVUSFJWVpVZmxApl5t5JeZT7tL3qZANwM5Etv98YYG0HxESh6nqp88i+Z4/F2IUlSRKinnC
	nSWBWAaLM14XTI09ntZzx5oI+ZPNtEZ1FwAn/4omBIrrHE8jjpuBF4p7U2+tAdlWzc/zPVcMhiKm8
	bLTYQe8Jci+dinGAOe5CiGgCuhynaM1FLtzoDSl5rTqKrFVPociNDVq6VJdSJ64Wm5w6JLufO4Gq/
	EqR7TwWj/XrJ9OZwx6sBv7bpNZJX/8nhBdFrsNhDGTOtZAVmd2GMdt6+31uvbXbYcqQWDXjGzxgww
	1KgtnOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZxVm-0069A3-5P; Wed, 08 Mar 2023 17:23:34 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZxUL-0068NZ-CZ
	for linux-amlogic@lists.infradead.org; Wed, 08 Mar 2023 17:22:07 +0000
Received: by mail-ed1-x535.google.com with SMTP id i34so68662244eda.7
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Mar 2023 09:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1678296121;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gi2/Eb1Zo9hhHNDy0Pd3SJNstommGgZa8uPvWPecc8c=;
        b=RymQpMXr8likQ2BN0NDf3eRNE2V5INccxmki9S1SnwBjuRO9opx1FIc0kW5GY/myaq
         Gc3PaXq/9nZTc+0DljWmTiT7IiVurhgY897koL0qAXypbSjrhD8ePgt6epEiyni58/+L
         +9ZmAkYoJs7nAKlQfstDw/Pq2lZ7BvMwvqaNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678296121;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gi2/Eb1Zo9hhHNDy0Pd3SJNstommGgZa8uPvWPecc8c=;
        b=0DfWLAzAxhA6kxlsTuE8ZcxztJ8MScCMu5RBqU4XKroArYVbGVZbs2LCbqBr8NUfl3
         9WOMjzXpfWdEr5i4zP0KfyAEnfaxaqzVJMLnjD9ZiCPCOKecsWXw3UvYDNwPJ6ElkpoT
         FXCJ+UOi/AuD//94ZTlnvWUyOiYay9obPgEKjnqZEv74o6GE7mDVKWiFOtuxJ1GBoRwG
         PiT5OtZFOwgCwZ9gBt9MGONHtvH6DdDQY+dXmlNng78kFYGv66siBCFjEKa8mSDTVQkS
         mfsS8UKMukOS4fnEdld8AbECrO2EXy5UkHzHpvwTn52sR+QqEb3Ff3YbWsdaBEjvLNNu
         VjSA==
X-Gm-Message-State: AO0yUKXfEPFllTN/L+CYfPhF5blfIkCu5QIXbjKZX4vZbbzDPz9V3f6+
	g6O2NdhNcbRpqzUdIXxrdNcEzBatC7C5vxYFyv1ZtQ==
X-Google-Smtp-Source: AK7set93f7sWYOkA8O22C1d8xzXdck+7na8pWL6R6m6wWyFeCeukDOAP/XVS0wpsNcL7NkfaaplVz551FgmxeRq0igQ=
X-Received: by 2002:a17:906:1411:b0:8b1:b795:110a with SMTP id
 p17-20020a170906141100b008b1b795110amr9659244ejc.13.1678296121270; Wed, 08
 Mar 2023 09:22:01 -0800 (PST)
MIME-Version: 1.0
References: <05977cbb-8a8f-0a67-b4bd-b265dbb83280@free.fr> <895a3812-e490-cc40-0f8e-a88e166e8f24@linaro.org>
 <c1a215cf-94be-871b-2a8a-3cc381588f83@free.fr> <6be2c348-b343-876a-a77f-a8297676de6a@free.fr>
 <a215e398-2c49-19d2-0730-5e8c51df1ed9@free.fr> <CA+8PC_du5dMwkmAshG2mM9TdeJft5aeAbEdDp0_q3Rxdvpq4MQ@mail.gmail.com>
 <f14407f1-e16f-0074-6e29-c597754ae617@free.fr>
In-Reply-To: <f14407f1-e16f-0074-6e29-c597754ae617@free.fr>
From: Franky Lin <franky.lin@broadcom.com>
Date: Wed, 8 Mar 2023 09:21:32 -0800
Message-ID: <CA+8PC_dFTvv9VtY9jBWLLwSoQzGxQd57zWMsnN6amddop4Yw-g@mail.gmail.com>
Subject: Re: [RFC PATCH] brcmfmac: add 43751 SDIO ids and initialization
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Arend van Spriel <aspriel@gmail.com>, 
	Hante Meuleman <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Pieter-Paul Giesberts <pieter-paul.giesberts@broadcom.com>, Alexander Prutskov <alep@cypress.com>, 
	Joseph chuang <jiac@cypress.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Angus Ainslie <angus@akkea.ca>, 
	linux-wireless@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_092205_734963_D0CEE790 
X-CRM114-Status: GOOD (  22.58  )
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
Content-Type: multipart/mixed; boundary="===============2750282763240220984=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============2750282763240220984==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000002962fc05f666c4c9"

--0000000000002962fc05f666c4c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 8, 2023 at 4:48=E2=80=AFAM Marc Gonzalez <marc.w.gonzalez@free.=
fr> wrote:
>
> On 08/03/2023 00:15, Franky Lin wrote:
>
> > On Tue, Mar 7, 2023 at 6:40=E2=80=AFAM Marc Gonzalez wrote:
> >
> >> Through the SDIO bus, the WiFi chip reports 0xaae7 (i.e. 43751)
> >> hence the /sys/bus/sdio/devices output above.
> >>
> >> sdio_read_func_cis() -> sdio_read_cis() which sets
> >> func->vendor/func->device to 2d0/aae7
> >>
> >>
> >> But when brcmf_chip_recognition() calls ci->ops->read32()
> >> i.e. brcmf_sdio_buscore_read32()
> >> [ vs brcmf_sdiod_readl() in brcmf_sdio_probe_attach() ]
> >>
> >> [    1.177283] brcmfmac: F1 signature read @0x18000000=3D0x1042aae8
> >> [    1.182912] found AXI chip: BCM43752/2
> >> [    1.186384] BCM43752/2: chip=3Daae8 rev=3D2 type=3D1
> >>
> >> Here it reports 0xaae8 (i.e. 43752)
> >>
> >> Why the discrepancy?
> >> Can it cause issues?
> >> (Sometimes, the whole SDIO bus doesn't probe at boot.
> >> I am still investigating these intermittent problems.)
> >>
> >> Should I use 43751 or 43752 firmware...?
> >
> > This question should be answered by the Cypress/Infineon folks but
> > unfortunately they have been quiet for a long time. In general we use
> > the id read from 0x18000000 to decide which firmware to load. But be
> > aware that the rev also matters. There are some examples in
> > brcmf_sdio_fwnames table that the different firmware name can be
> > derived from the same chip common id but different rev.
> >
> > However sdio device enumeration happens before firmware download so
> > the intermittent problem you are facing probably is not related to
> > firmware version.
>
> Disclosure: My knowledge of SDIO device enumeration is 0.
>
> When the host sends the equivalent of an "identify yourself" message
> on the SDIO bus, doesn't the reply come from the WiFi device?
> Why would the device reply 0xaae7 instead of 0xaae8?
>
> In other words, who is replying 0xaae7?

The enumeration response is done by the HW sdio core on the chip.  No
software involved.

Regards,
- Franky

--0000000000002962fc05f666c4c9
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
BZrfei1PlO2m9d3AfpeD7Y1pVL1SrZC1yvhXeDO463M8rGKz/l8XZrJY1P6qU8U6QwxjFgXr5o5B
9N6Yw9IhwXhZI3m6F1pe3mMdZ9cFC3xS3Ke+awIDAQABo4IB2DCCAdQwDgYDVR0PAQH/BAQDAgWg
MIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUFBzABhjVo
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMDBNBgNV
HSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2ln
bi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRwOi8vY3Js
Lmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAiBgNVHREEGzAZ
gRdmcmFua3kubGluQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAW
gBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQU0v383z+6bcUXkukYi4fq7VBiM6swDQYJ
KoZIhvcNAQELBQADggEBABUIiuJPuLq9vbb6/7d0VJ6LS6osA6kNs0Tph9iEX49TxPQJtvA97oy4
AgPCjWNiAMLkmu+kNQKlNZG3Vl3S4A+VMOogB6aKtiLlz73Cs0sPgpohw6GSS41TKVt17PrAzo0o
/xuXczzIbtvrpoi6OnGlsW4aVCqQSOqKUamG8wU8u3/h+iPM1rr4z6ZHdyrllNi+ukH/Z6Dpn6wF
ATUa+n5ReFZpli4TzcqVHw7i+OaB23TMHCwed4OPFm0H3zcCJgVtgt3z95IPak7bBuYLAGMT2c3K
Xkdn27MnpydqZw5mnP970DgyUMHXY3Jvj65UAVioJUr4LkNBL7Tsk/6q0FExggJtMIICaQIBATBr
MFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9i
YWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgxcbvtv+NUbtJoPDWwwDQYJYIZI
AWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIL5bGb7GZcg5jzjpKN9XRPfia8aBZKL2bbs9+ITD
AuxEMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIzMDMwODE3MjIw
MVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQB
AjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkq
hkiG9w0BAQEFAASCAQCUN7BJiTTe8WxuCqRtwpN5NRtRknBTFciggy6Qv3rriI2fxUkJH25YuD2u
pWCsQmh2vvFGzPGSJYrcKvkZYncZ9kL9hwZ7ktNodWUJbP8UjDmKMKJGSFfiqv1jD6FIdY3VTY4G
rOEjrZ3PhoF732dzb7qJV4pgLRXzycWsmC8LB3BXABsyGgSkB4R2CNOxFjbr8gC0tOj6lmEWZwy6
tVPdokRo/V5DPxYrZyHGPw3lPpmL8MpBCRoZvTtRciXOMLUhM5ZLR/tJ4xypFuApTUIlTaFC9usK
/JihSQDdmulLFRWVTlLxQkH2rDbLzhgU1o1Ku6azCCJrTZZ1vT9WVsbp
--0000000000002962fc05f666c4c9--


--===============2750282763240220984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2750282763240220984==--

