Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F010C678D5
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Mar 2023 23:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:
	To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9kBsob44U2+jOXpbnzZ9MpVpu4jDw/Da7XMsT7JaaKk=; b=jvctxDKW7bUzE0vEZXcrmUaUwY
	PfhSrPUkdCyZeWcckBdoKpVuXfeNu68rMpJ1b4L0a2OMrAnnNpsXuhkWloDwRahY6lhVVDsBr/bOv
	RpuFciG/0a+XnnUxVYC3UrnB2NXBry9xSwnpipNCmbfHO3Vi6IjrPWQkcGtK8xJ0yR697EpkQjhgu
	oCLKAX6iHEEoiD3DnkCMpzIlK+jUvcQVNu3fUbzp2F4F303hkhakI2RGp2DALjmlCMUK8UJxDWND4
	4U5d6+Ghtoc0xuh3uDilrEY0yY2DlAIm7mAd5IkrtLJs2Nn4A7KBOhcbpc5LRoyVcyS31FIPgMmCZ
	yJ/fQCbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZgX8-002p0r-OA; Tue, 07 Mar 2023 23:15:50 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZgX4-002p0C-Rk
	for linux-amlogic@lists.infradead.org; Tue, 07 Mar 2023 23:15:48 +0000
Received: by mail-ed1-x530.google.com with SMTP id k10so34987202edk.13
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Mar 2023 15:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1678230944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ATD82w4Uzq62EXqAuYI30aNJUcBvQhgPQMRTkqoOP/Q=;
        b=ccjIBuHNJri3zzFqNWRkS+VLz9m0l4yF6A7aIft6xmtz1h9P48IIupWodzV5hgPwdW
         yHqpg728R5HKZo3NkL/dE69ci29njXXww3xb/C9M8fqs/cUzLUxPhCf6dKpc+UUp85Nm
         dzG0/YV6ITM0fI5A2DEYpBoe2KkP+ktaeylCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678230944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ATD82w4Uzq62EXqAuYI30aNJUcBvQhgPQMRTkqoOP/Q=;
        b=n1bbFl292F5JrpGq085yCliIUhQfXx8PRoXbDN6gMmDFWjCpJC9VmvXkofbvodJ8eq
         c5hAPTMzRLT08ATN5yvGh4dVm2dit5cdSGc2HWSR0WdxMFCmXSZfmKGD2URmfsUA1zDP
         eDfo3QIBgbJ51/XHYzfJUqSbGvzuZrxLkkouGA4V4oBU9qOSTVmraIS2Ef9WR5Uhlc8p
         DS5PzW+PPX6qcTf5DcRQ49KVt7V50m0D4oa/V8fh+vcx9tRUReimcqqNaZhn7QYSF3TL
         iz7ZeaZZPAn8d1XGeTCmJ4kFoVu3Gjcb53/GifNAfBKRxQSye+okAI+hFu5fEFD0iL3k
         P7Ig==
X-Gm-Message-State: AO0yUKVJOaRhx1LGNt8krpQA7Vl8QfAwlvW0/JMFTQ1cPFK6oGGdnkzp
	BNH7SNnDf4lW8MvF4ZtsAqF+l54KP89nXt/kRAN1Cg==
X-Google-Smtp-Source: AK7set/N5F8fE4yKA3XQ+PsxXjvloLB4RdlQpyV8IotSZcUtwXqCmc1OOPVxv18jQLpAYxhP1G5kjwDIR2mOJVscNB4=
X-Received: by 2002:a17:906:a0d8:b0:8b1:3d0d:5333 with SMTP id
 bh24-20020a170906a0d800b008b13d0d5333mr7267360ejb.13.1678230943730; Tue, 07
 Mar 2023 15:15:43 -0800 (PST)
MIME-Version: 1.0
References: <05977cbb-8a8f-0a67-b4bd-b265dbb83280@free.fr> <895a3812-e490-cc40-0f8e-a88e166e8f24@linaro.org>
 <c1a215cf-94be-871b-2a8a-3cc381588f83@free.fr> <6be2c348-b343-876a-a77f-a8297676de6a@free.fr>
 <a215e398-2c49-19d2-0730-5e8c51df1ed9@free.fr>
In-Reply-To: <a215e398-2c49-19d2-0730-5e8c51df1ed9@free.fr>
From: Franky Lin <franky.lin@broadcom.com>
Date: Tue, 7 Mar 2023 15:15:15 -0800
Message-ID: <CA+8PC_du5dMwkmAshG2mM9TdeJft5aeAbEdDp0_q3Rxdvpq4MQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230307_151547_042940_1F350E7D 
X-CRM114-Status: GOOD (  19.71  )
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
Content-Type: multipart/mixed; boundary="===============4294859911711244674=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============4294859911711244674==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000046c37a05f657979e"

--00000000000046c37a05f657979e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 7, 2023 at 6:40=E2=80=AFAM Marc Gonzalez <marc.w.gonzalez@free.=
fr> wrote:
>
> On 06/03/2023 11:41, Marc Gonzalez wrote:
>
> > On 06/03/2023 11:24, Marc Gonzalez wrote:
> >
> >> # cat /sys/bus/sdio/devices/mmc2:0001:1/uevent
> >> OF_NAME=3Dwifi
> >> OF_FULLNAME=3D/soc/sd@ffe03000/wifi@1
> >> OF_COMPATIBLE_0=3Dbrcm,bcm4329-fmac
> >> OF_COMPATIBLE_N=3D1
> >> SDIO_CLASS=3D00
> >> SDIO_ID=3D02D0:AAE7
> >> SDIO_REVISION=3D0.0
> >> MODALIAS=3Dsdio:c00v02D0dAAE7
> >>
> >> 0xaae7 =3D 43751
> >>
> >> Isn't there some overlap between:
> >> include/linux/mmc/sdio_ids.h and
> >> drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h ?
> >>
> >> Reference used: commit d2587c57ffd8dc
> >> "brcmfmac: add 43752 SDIO ids and initialization"
> >>
> >> Looking at all the occurrences of 43752 to insert a 43751,
> >> could someone comment whether this looks reasonable?
> >
> > Obviously, the commit message would have to be rewritten
> > for a real patch.
>
> Help. I am thoroughly confused... :(
>
>
> Through the SDIO bus, the WiFi chip reports 0xaae7 (i.e. 43751)
> hence the /sys/bus/sdio/devices output above.
>
> sdio_read_func_cis() -> sdio_read_cis() which sets
> func->vendor/func->device to 2d0/aae7
>
>
> But when brcmf_chip_recognition() calls ci->ops->read32()
> i.e. brcmf_sdio_buscore_read32()
> [ vs brcmf_sdiod_readl() in brcmf_sdio_probe_attach() ]
>
> [    1.177283] brcmfmac: F1 signature read @0x18000000=3D0x1042aae8
> [    1.182912] found AXI chip: BCM43752/2
> [    1.186384] BCM43752/2: chip=3Daae8 rev=3D2 type=3D1
>
> Here it reports 0xaae8 (i.e. 43752)
>
> Why the discrepancy?
> Can it cause issues?
> (Sometimes, the whole SDIO bus doesn't probe at boot.
> I am still investigating these intermittent problems.)
>
> Should I use 43751 or 43752 firmware...?

This question should be answered by the Cypress/Infineon folks but
unfortunately they have been quiet for a long time. In general we use
the id read from 0x18000000 to decide which firmware to load. But be
aware that the rev also matters. There are some examples in
brcmf_sdio_fwnames table that the different firmware name can be
derived from the same chip common id but different rev.

However sdio device enumeration happens before firmware download so
the intermittent problem you are facing probably is not related to
firmware version.

Regards,
- Franky

>
> Regards.
>
>

--00000000000046c37a05f657979e
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
AWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIOj6ieZcptq/gHNhWLug6B0/ZtNXrltr14K2Ca+l
B1lgMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIzMDMwNzIzMTU0
NFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQB
AjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkq
hkiG9w0BAQEFAASCAQCMO5mBIr7t0rF5wQJUHnLKywA9CBLDJB46CgTQZOiesHn1opp1Ffj8wbDv
Mez9cT+fN6xwfZ8AhPyRNS5HeIXFcfqxDmnsmpZKB9E1AAAyH0V0TrvnetnUW7/vAWTgF64v1qH0
XJqO9nm616kvEX793arme+5Uk12IVS/PBgOutJfOHm91V4IRpXHPiWV0JKiHn0WzNp8XTbLOvnvD
TI3BFZTCu5+NhhICDfFkhUi0MoXvsoavUIYDjDMrMBdVwYRRaIglQDNqo76spCn85UBMk05clkwU
rgYowYoai99OgO0OjyPfSagqxvuKwxx7C4X4grzUC270Q6m3BClCyECk
--00000000000046c37a05f657979e--


--===============4294859911711244674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4294859911711244674==--

