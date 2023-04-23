Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87251C77B60
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Apr 2023 20:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I01r0yli2YK06dFGzsRNlbdejSYz6I45Uw5q91D6LoQ=; b=eU6K2mcH7o9tP9
	lnowe7HjYYEUkT30Qkh1p+4mjmEwZtJPsNjo/q515AxddT7/Wl7xUMsBTclDQGTpMpXUjPyDb4iKi
	ACsijbaYPVcDtaQdUBAjffz8rDNL7h/wvV/R5LIhZjZHh85kj5WPbDAIzUdEapZmKOpXBgmoo13Q6
	S2MS8281jbMC7nDIWB0jLvWKsct7Q+PQyijrONSNcja4vLQfQAaaJrRPl7ugx25eRx442CGzVBK21
	NNTi/orHelGBMZ9xtRFhNr2xiM62H6hKO2nsyQ5KMnMyMi38NptDmuXj/cEddJxs6jkbQ6EtrrudS
	QTwzg4pKjCtyVGw5X8EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqgn1-00Ek5J-1C;
	Sun, 23 Apr 2023 20:58:31 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqgmw-00Ek4W-2z;
	Sun, 23 Apr 2023 20:58:28 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-959a3e2dc72so75425566b.2;
        Sun, 23 Apr 2023 13:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1682283505; x=1684875505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IY5GmMnxqaIW+YsbqRgEPcpd7ww+Ak1Qib0SWHWH38U=;
        b=qjC5ZhUiwTYk+IzeiX0eotOTUeAuIyB5rrQd1lJfL7dGhD0BlpBXliVMYu5PGOGsUe
         TE++dICoxPlTTE/cdPkljxRLAM615ZqfbJT8fDbT4DzM/Nj1HDuzh6Vvnfh7ZW3kQscf
         RVDdGKy8kOXBPxr69sKomibLalXErGB1ePvh+t872Yv63tz5UItdEbEr1G6Yu4sRH0Y4
         JrjmugIk+7VRCEc84WmSHv2AF9prr3kSvTQulGyygHPlnB9uBz1H6Bueuv7iG1r2jnhS
         AnzlT+azFRG4idYjskLTSnuFK4SkGQZMDUsGCADfvGmdMlgpVMOj4IRmRIn6Plj3T9Yx
         hQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682283505; x=1684875505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IY5GmMnxqaIW+YsbqRgEPcpd7ww+Ak1Qib0SWHWH38U=;
        b=A6FTWGfpxUkXnmHzHIfzraV7NGIx2p+bxpJDtkyhczZS9RCFnm4PT/Ti4PUL8SWX3f
         fCuBf2y/XamnVPYM1Knu8t47cYtyaUx/jsInFjuGjO//gM+T9vxGOK5+5Ymzs7xtdmcM
         PWo75PTSMX13svHYL98qYerhwGLYwkSWO1p+6Ifo0vDIXp2FSDM0+BUB+JpnJSfDn7LH
         PQfQ0wymqEGmK0S7nQppYaeh2WM2RD/E/Ct0X4KnUPrHWAsNqkVfrsUgBgeWk7gbqhoW
         8Ca8qfAO+qtPE1ifle5yzdWXLnZmWb60cWDfz8Lh5ZilDsG/SgcGiZpJZBHc1v2b61tk
         Rtwg==
X-Gm-Message-State: AAQBX9dKAF+EyHtG9kTNMXcZLqTp1JGod4mByqRIScIt+59ApM2xjf4W
	PgEy618XEgaELgJxEIY30RVfJbHLbE4vkRk+Xf0=
X-Google-Smtp-Source: AKy350ZsmjTPL0vzoiJJX7Vfs3uXUqDV4mDqCzlplxejwNy1QwSj4RRBsAguoR0i09W3HWLKB/9X1f3F6LwVdKFmdvw=
X-Received: by 2002:a17:906:1498:b0:94f:322d:909c with SMTP id
 x24-20020a170906149800b0094f322d909cmr8440339ejc.34.1682283504786; Sun, 23
 Apr 2023 13:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <9faca2e6-b7a1-4748-7eb0-48f8064e323e@gmail.com>
 <cb79d313-c7a2-42e9-639a-63cb5366521a@gmail.com> <ca531c1a-3c62-5fb1-6765-68ec1e541483@linaro.org>
 <73a52391-b380-e491-0e96-5c51c7be487c@gmail.com> <22b6f870-8dfd-c01b-a7cd-383a9d9ece20@linaro.org>
 <872b3270-8319-6b4d-9d52-1da0b58d4e19@gmail.com> <229e20ef-6e99-6d52-b0e6-a357a184b6af@linaro.org>
 <87f14a9d-f341-d694-f567-7f9e78666b5d@gmail.com>
In-Reply-To: <87f14a9d-f341-d694-f567-7f9e78666b5d@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 23 Apr 2023 22:58:13 +0200
Message-ID: <CAFBinCAF4oc+FoG8CtQhpSHSAkODQFXGbt5OvtprGSb4s+fWqg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] pwm: meson: make full use of common clock framework
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: neil.armstrong@linaro.org, Jerome Brunet <jbrunet@baylibre.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_135826_967558_427476CC 
X-CRM114-Status: GOOD (  13.61  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBBcHIgMTksIDIwMjMgYXQgOTo1OOKAr1BNIEhlaW5lciBLYWxsd2VpdCA8aGthbGx3
ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgpbLi4uXQo+ID4gVGhpcyBpcyBhIGhhY2sgYmFzZWQgb24g
Y3VycmVudCBjbG9jayB2YWx1ZXMsIGVpdGhlciBleHBsaWNpdGx5IHN1cHBvcnQgYSBjb2RlIHBh
dGgKPiA+IHdoZXJlIHByZV9kaXYgPSAwIG9yIGlmIHlvdSBjYW4ndCBkbyB0aGF0IHdpdGggQ0NG
IGltcGxlbWVudCB0aGUgcGluY3RybCB3YXkgdG8gaGFuZGxlIHRoaXMsCj4gPiB3aGljaCBpcyB0
aGUgY2xlYW5lc3QuCj4gPgo+IFRvIG1ha2UgaXQgZXhwbGljaXQgd2UgY291bGQgcmVxdWVzdCBV
TE9OR19NQVggYXMgcmF0ZSBpbnN0ZWFkIG9mIDFHSHosIHRoaXMgd291bGQgaW1wbHkKPiBjaG9v
c2luZyBtdXggcGFyZW50IHdpdGggaGlnaGVzdCByYXRlIGFuZCBwcmVfZGl2ID0gMC4gVXAgdG8g
eW91IHdoZXRoZXIgdGhpcyB3b3VsZCBiZQo+IGFjY2VwdGFibGUuCkkgbGlrZSB0aGUgaWRlYSBv
ZiB1c2luZyBVTE9OR19NQVggYXMgSSBmaXJzdCBoYWQgdG8gdGhpbmsgYWJvdXQgd2h5CnlvdSBj
aG9zZSAxR0h6IGluIHRoZSBkcml2ZXIuCgo+IEFGQUlDUyBwaW5jdHJsIHdvdWxkIG5lZWQgcXVp
dGUgc29tZSBEVFMgY2hhbmdlcywgYW5kIGl0J3Mgbm90IG15IGFyZWEgb2YgZXhwZXJ0aXNlLgo+
IFNvIGl0IHdvdWxkIGJlIG9wZW4gd2hvIGNhbiBpbXBsZW1lbnQgdGhpcy4KTXkgb3BpbmlvbiBp
cyB0aGF0IHRoaXMgY2FuIGJlIGRvbmUgaW4gYSBzZXBhcmF0ZSBwYXRjaC4gV2UgbmVlZCB0bwp3
b3JrIG9uIHRoaXMgd2hvbGUgdGhpbmcgYW55d2F5cyBhcyB5b3UgbWVudGlvbmVkIHRoYXQgbmV3
ZXIgU29DcwooZnJvbSB3aGF0IEkgdW5kZXJzdGFuZDogRzEyQSBvbndhcmRzKSBoYXZlIGEgZGVk
aWNhdGVkICJjb25zdGFudApvdXRwdXQiIGJpdCB3aGljaCB3aWxsIG1ha2UgdGhlIHBpbmN0cmwg
c29sdXRpb24gdW5uZWNlc3NhcnkgKGF0IGxlYXN0CmJhc2VkIG9uIGhvdyBJIHVuZGVyc3RhbmQg
aXQpLgoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
