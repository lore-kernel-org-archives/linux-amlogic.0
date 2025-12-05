Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286F4D2F7D0
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Dec 2025 10:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sw6kpgDxD2ORpwn6Vq+3zck9gZjM8fNYkW8e5Jj4bPY=; b=3MTMdEs/qTXxLd
	kKW6ASwDUSHWUvnMVynHa070bXWfvKCywv7hgC89wrkjuNl8YskksL1pMmoWmQfhiYwYilrdq5v7w
	KpnoJ7fUPrwGV892nkos4pUJAVxF4cYagltUDn79bD4ZaxhAO5tVbyrXGFzbrI7UEc3PQS9KvNGoA
	RgeAX6bDuskKy2PTnOxiGi0CqxeOmJuYw8LY8CIX6tUbe3dG5BsMegXuj/sjkOxuik4euRewCt4V9
	Ol3sl81vz2X7lsLqXGrlcBo0shRcQ5jl/sSJ+qwTSnKz2Y+2B9VLumfkiRPeHN8L1UOBlSPPOps5T
	dVZVj2PkAU+piSbXZFcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSfT-00000009MOr-21eN;
	Fri, 05 Dec 2025 10:04:03 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSfQ-00000009MMF-3Nwe
	for linux-amlogic@lists.infradead.org;
	Fri, 05 Dec 2025 10:04:02 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b7277324054so275789266b.0
        for <linux-amlogic@lists.infradead.org>; Fri, 05 Dec 2025 02:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764929039; x=1765533839; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrPIgvsg58eOsedSnhLH7or6+6ch9iVeKdBWBSvRqYc=;
        b=ZnDZv3PQP3ByVrgBY/Ueq3nld3LMZOl+jrP9s5fVTpJGoxw0aqfg+rge0qbM3OElTB
         aLQIqqKqOBLjmFXqWhHJMy+vn3kJzPKOML2C7M1PQpt14mukRwz69838DXIS7/4pOZhM
         mRn8m7G/ffmSqbi3Xrxz3+dReGhzRz0BEKdd+zT0J/oy93avxRfxk3ldwHZdiy/s6yDN
         r1SvUmmf9ON6VMz2hdy5iIq29V/Bm7HTKY84DC4mgdBuAunRrhyw1XsGrwtDNikg7AGd
         VDkqfJKtAivFTQW7//vTvJOrBvOv31XMrpWc/wKIKFWMr7Zo2twY10PXou98/ahzx6PZ
         ucJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764929039; x=1765533839;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UrPIgvsg58eOsedSnhLH7or6+6ch9iVeKdBWBSvRqYc=;
        b=YU3MNTDplz8iMQfUvt6qQOnYJihYGG/To0VUNKdTaR1TY6EC6nn6KSEg1soUpA4D2P
         ZZXyRZP3jPfnp4sh7aumaCkKLNelyJIg5nKx+eIIqqJAN78pkdSh+RAvv7ryg28yds0+
         TG1nOiDtdzgsQMAeP66bEbBxDytjqstnzp5ZAiQLXUKWVXepNznwgOn6+FLr8Myw55wK
         tewvQ0JqvHqb53PImExxdUeeibJFo8q6YJnOB2dDNkGWgXWsidXVcbN+Nus9OeuG7GtQ
         WcuHQFuzjb7Az1vmGVm7B2JBVfBvxueMOuL6KMhwaIynwsPjLr/gZ/CP/TQnRR8TAdgc
         F/XA==
X-Forwarded-Encrypted: i=1; AJvYcCXu1+MU/wV6OS2ukF1gg7ogPhagmHK2x+ar0maGipi3sU1j2Zk8Q8wvnk6luEA+FMVC+4sitIUiFwNGLzp/@lists.infradead.org
X-Gm-Message-State: AOJu0YzzyX3vppRu259y31tMYFc4ViLYX4GOopBdRIF+rRYeeFzbBD4K
	U8vsirXTNez1Bwr9sihv1o0lo/U+Yn2Z4/qlHRQYWj+R1PrUgiFoydh5
X-Gm-Gg: ASbGnctSAiJeZzR1xIUqngzZOIaTzSS2aNe0SEie734/ND7y3AZX3ZESoVUr1lYXeVP
	1b/tdvWD2yNtXCkVlpQbAk1ftfC/qknC16OST7qBzinh1HuUZWg7/pTcbbGA4DXtWX4Dhifo2gG
	j+09EA1DDlw6/JXLHV1HfM04FNPtOlhx65kLicvLZjhs22Yaxnr45wIY95+29r40bcFtOI0NJbe
	wmGFYajlGB7sF76gvPkU9rAQXEhHJNO+7GBRJYkWvk4nfgYO7j7Waw0R7oEeESEq1LMa8l0WjkD
	NH6+vWBaK7J5Fl8i/cIca6mAN6LS8Ke+pcHtkRPTYdpFc8PGrz9tiF+y8Q9cKxfSzx08BrQLEhy
	spNyltf/fYyZEGLZP0eSAryzP4WKvvbfnI1uHO/YT4ODN1sgWPxLrLmmLgxdZcsuiY95vtVQzji
	ud56vSf4+8b/XkKjUnR2fu9pp11eIdVYDztG/sVy3pLPFXVwhxm7o3ikKw63CpP0KmIfLySxDOC
	gI=
X-Google-Smtp-Source: AGHT+IGmVNPybgxaTnBEjYF9iUoQvCh+If0y7frV3hE4t1NG2W8NXsB234VYEXtYlgdaKQwxequung==
X-Received: by 2002:a17:907:daa:b0:b72:fd32:a463 with SMTP id a640c23a62f3a-b79dbe9000bmr989333866b.23.1764929038231;
        Fri, 05 Dec 2025 02:03:58 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4a2f401sm333937766b.65.2025.12.05.02.03.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Dec 2025 02:03:57 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 01/11] dt-bindings: display: meson-dw-hdmi: Add compatible
 for S4 HDMI controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <b6b8203d-2a51-428f-8124-fa65d2c073a0@amlogic.com>
Date: Fri, 5 Dec 2025 11:03:44 +0100
Cc: Chuan Liu <chuan.liu@amlogic.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <9BCB2E8F-F8FA-4CA4-9039-FADE0D875404@gmail.com>
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
 <3AC316FA-A633-4B6C-81BA-CCCA290E7F03@gmail.com>
 <8c3b9fa4-326e-4791-8154-07b268faa132@amlogic.com>
 <7703796D-35D4-4AD2-B7F8-B75D2BE0F7AD@gmail.com>
 <a71f24c9-1f40-45a1-8fdb-6075bbf89930@amlogic.com>
 <F04DC684-AD64-447F-87EC-F503D411F25D@gmail.com>
 <070eb0a3-2f6e-41ef-8310-0c592a2816dc@amlogic.com>
 <b6b8203d-2a51-428f-8124-fa65d2c073a0@amlogic.com>
To: Ao Xu <ao.xu@amlogic.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_020400_893260_5BD441A6 
X-CRM114-Status: GOOD (  24.51  )
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

QW8sCgpUaHghCgpJbmRlZWQgcGF0Y2ggaGVscHMgd2l0aCBib290IGZyZWV6ZS4KSSBzdGFydGVk
IHRvIHNlZSBvbiBtb25pdG9yIC0gd2l0aCBjb3JyZWN0IHJlc29sdXRpb24gLSA0IHR1eGVzIGlu
IHVwcGVyIGxlZnQgY29ybmVyIDotKQoKTm93IGknbSBnZXR0aW5nIHVzZXIgc3BhY2Ugb29wcyBs
aWtlIHRoaXM6IAoKaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vd2FycG1lL2I4Yjc1N2JjMTQ0NGJl
OGExMzc4NDkzMDE2OThlZTRiCgppJ20gcHJldHR5IHN1cmUgaXQgaXMgcmVsYXRlZCB0byBsYWNr
IG9mIChvciBpc3N1ZSB3aXRoKSBjb25zb2xlIGF0IGtlcm5lbCBlYXJseSBpbml0IGluIHVzZXIg
c3BhY2UuCgpBcyBrZXJuZWwgd2l0aCBzNCBoZG1pIGNvZGUgd29ya3MgZm9yIHlvdSAtIGJ1dCB0
cmFwcyBmb3IgbWUgLSBpIHRoaW5rIHRoZXJlIGlzIHN0aWxsIGlzc3VlIHdpdGggczQgaGRtaSBj
b2RlLgpJIHN1c3BlY3QgaXQgaXMgYmVjYXVzZSBkaWZmIGJldHdlZW46IG15IGtlcm5lbCBjb25m
aWcgYW5kIHlvdXJzLgooc28gaXQgaXMgZXhwb3NpbmcgZXhpc3RpbmcgaGlkZGVuIGlzc3VlKQoK
YnR3OiBJJ20gbm90IHN1cnByaXNlZCBieSB0aGlzIGFzIG15IGtlcm5lbCBjb25maWcgaXMgbXVs
dGktc29jIChjb21tb24gZm9yIGJjbTI1eHgvMjd4eC9zOTA1L3M5MTIvZzEyL3NtMS9zNC9oNi9o
NjE2L2E1MjMvaDcwMC9yazMzeHgvcmszNXh4L3FjczY0OTApClVzdWFsbHkga2VybmVsIGNvbmZp
Z3MgZG9uZSBmb3Igc2luZ2xlIHNvYyAocHJvYmFibHkgY29uZmlnIHlvdSBhcmUgdXNpbmcgdG8g
dGVzdCBzNCBoZG1pIGNvZGUpIGFyZSBub3QgZXhwb3NpbmcgaGlkZGVuIGlzc3VlcyBleHBvc2Vk
IGJ5IG11bHRpLXNvYyBjb25maWcgKGxpa2UgbWluZSBjb25maWcpLiAKSSBkZWFsIHdpdGggc3Vj
aCBpc3N1ZXMgbXVsdGlwbGUgdGltZXMgaW4gcGFzdC4KCm11bHRpLXNvYyBjb25maWcgaSdtIHVz
aW5nIGlzIGxpa2UgdGhpczogaHR0cHM6Ly9naXRodWIuY29tL3dhcnBtZS9taW5pbXl0aDIvYmxv
Yi9tYXN0ZXIvc2NyaXB0L2tlcm5lbC9saW51eC02LjE4L2ZpbGVzL2xpbnV4LTYuMTgtYXJtNjQt
YXJtdjguY29uZmlnCgpNYXkgeW91IHBscyB0cnkgdG8gY29tcGlsZSB5b3VyIHM0IGhkbWkgY29k
ZSB3aXRoIGFib3ZlIGNvbmZpZz8KSSdtIHF1aXRlIHN1cmUgaXQgd2lsbCBleHBvc2UgdG8geW91
IGlzc3VlIGknbSBnZXR0aW5nLi4uLgoKCgoKPiBXaWFkb21vxZvEhyBuYXBpc2FuYSBwcnpleiBB
byBYdSA8YW8ueHVAYW1sb2dpYy5jb20+IHcgZG5pdSA1IGdydSAyMDI1LCBvIGdvZHouIDA4OjA5
Ogo+IAo+IEhpIFBpb3Ry77yMCj4gCj4gICAgIEkgYXBwbGllZCB0aGlzIHBhdGNoOiBodHRwczov
L2dpdGh1Yi5jb20vd2FycG1lL21pbmlteXRoMi9ibG9iL21hc3Rlci9zY3JpcHQva2VybmVsL2xp
bnV4LTYuMTgvZmlsZXMvMDMxMi1kcm0tbWVzb24tYWRkLXZwdS1jbGstc2V0dGluZy1mb3ItUzQu
cGF0Y2gsIGFuZCByYW4gaXQgb24gdGhlIGJvYXJkLgo+IAo+ICAgICBJIGVuY291bnRlcmVkIHRo
ZSBzYW1lIGlzc3Vl4oCUdGhlIHN5c3RlbSBmcm96ZS4KPiAKPiAgICAgSSBmb3VuZCB0aGF0IHRo
ZSBwYXRjaCBoYXMgYSBmZXcgbWlub3IgcHJvYmxlbXMuIEFmdGVyIGZpeGluZyB0aGVtLCB0aGUg
c3lzdGVtIHJ1bnMgbm9ybWFsbHkuIENvdWxkIHlvdSB0cnkgdGhlIGZvbGxvd2luZyBwYXRjaD8K
PiAKPiAKPiDlnKggMjAyNS8xMi8zIDEzOjU2LCBBbyBYdSDlhpnpgZM6Cj4+IEhpIFBpb3Ry77yM
Cj4+IAo+PiAgICAgSSB3aWxsIG5lZWQgYWJvdXQgdHdvIG1vcmUgZGF5cyB0byBsb29rIGludG8g
aXQuIEkgd2lsbCBmb2xsb3cgdXAgd2l0aCB5b3UgQVNBUC4KPj4gCj4+IAo+PiDlnKggMjAyNS8x
Mi8yIDE2OjI5LCBQaW90ciBPbmlzemN6dWsg5YaZ6YGTOgo+Pj4gW1lvdSBkb24ndCBvZnRlbiBn
ZXQgZW1haWwgZnJvbSBwaW90ci5vbmlzemN6dWtAZ21haWwuY29tLiBMZWFybiB3aHkgdGhpcyBp
cyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0
aW9uIF0KPj4+IAo+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+PiAKPj4+IEFvLAo+Pj4gQW55IGNo
YW5jZSBmb3IgdXBkYXRlZCBzNCBoZG1pIHNlcmllcyBmb3IgNi4xOD8KPj4+IAo+Pj4gCj4+Pj4g
V2lhZG9tb8WbxIcgbmFwaXNhbmEgcHJ6ZXogQW8gWHUgPGFvLnh1QGFtbG9naWMuY29tPiB3IGRu
aXUgMjEgbGlzIDIwMjUsIG8gZ29kei4gMDM6NTU6Cj4+Pj4gCj4+Pj4gSGkgUGlvdHLvvIwKPj4+
PiAKPj4+PiAgICAgIEkgd2lsbCBjaGVjayB0aGlzIGlzc3VlCj4+Pj4gCj4+Pj4g5ZyoIDIwMjUv
MTEvMTkgMTg6MjcsIFBpb3RyIE9uaXN6Y3p1ayDlhpnpgZM6Cj4+Pj4+IFtZb3UgZG9uJ3Qgb2Z0
ZW4gZ2V0IGVtYWlsIGZyb20gcGlvdHIub25pc3pjenVrQGdtYWlsLmNvbS4gTGVhcm4gd2h5IHRo
aXMgaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlm
aWNhdGlvbiBdCj4+Pj4+IAo+Pj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Pj4gCj4+Pj4+IFBs
cyBzZWUgaW5saW5lCj4+Pj4+IAo+Pj4+Pj4gV2lhZG9tb8WbxIcgbmFwaXNhbmEgcHJ6ZXogQ2h1
YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5jb20+IHcgZG5pdSAxOSBsaXMgMjAyNSwgbyBnb2R6
LiAwMzo1NzoKPj4+Pj4+IAo+Pj4+Pj4gSGkgUGlvdHIsCj4+Pj4+PiAKPj4+Pj4+IAo+Pj4+Pj4g
T24gMTEvMTgvMjAyNSAxMDo1MCBQTSwgUGlvdHIgT25pc3pjenVrIHdyb3RlOgo+Pj4+Pj4+IFtZ
b3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gcGlvdHIub25pc3pjenVrQGdtYWlsLmNvbS4g
TGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRT
ZW5kZXJJZGVudGlmaWNhdGlvbiBdCj4+Pj4+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Pj4+Pj4g
QW8sCj4+Pj4+Pj4gSXMgdGhlcmUgYW55IGNoYW5jZSB0byBnZXQgdGhpcyBzNCBkcm0gaGRtaSBz
ZXJpZXMgZm9yIGN1cnJlbnQgNi4xOD8KPj4+Pj4+PiAoaSB0cmllZCBiYWNrcG9ydCB0aGlzIHNl
cmllcyB0byA2LjE4IGJ1dCBoYXZlIHNvbWUgaXNzdWVzIHdpdGggcmVwYXJlbnQgdnB1XzBfc2Vs
IHRvIHN5c2Nsa19iX3NlbCkKPj4+Pj4+IFdoeSBkbyB3ZSBuZWVkIHRvIHJlcGFyZW50IHZwdV8w
X3NlbCB0byBzeXNjbGtfYl9zZWw/IGlzIHRoZXJlIGFueQo+Pj4+Pj4gYmFja2dyb3VuZCBoZXJl
Pwo+Pj4+PiBXZWxsIC0gaXQgbG9va3MgaXQgaXMgYmVjYXVzZSBidWcuLi4uCj4+Pj4+IE1hcnRp
biBCbHVtZW5zdGluZ2wgaGFkIHBlcmZlY3QgZXllIGFuZCBjYXRjaCB0eXBvIGluIHBhdGNoIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDExMC1kcm0tczQtdjEtMTEtY2JjMmQ1ZWRh
YWU4QGFtbG9naWMuY29tLzogCj4+Pj4+IAo+Pj4+PiBCeSByZXBsYWNpbmc6Cj4+Pj4+IGFzc2ln
bmVkLWNsb2NrLXBhcmVudHMgPSA8JmNsa2NfcGVyaXBocyBDTEtJRF9GQ0xLX0RJVjM+LAo+Pj4+
PiA8MD4sIC8qIERvIE5vdGhpbmcgKi8KPj4+Pj4gPCZjbGtjX3BlcmlwaHMgQ0xLSURfVlBVXzA+
LAo+Pj4+PiA8JmNsa2NfcGVyaXBocyBDTEtJRF9GQ0xLX0RJVjQ+LAo+Pj4+PiA8MD4sIC8qIERv
IE5vdGhpbmcgKi8KPj4+Pj4gPCZjbGtjX3BlcmlwaHMgQ0xLSURfVkFQQl8wPjsKPj4+Pj4gCj4+
Pj4+IHdpdGg6Cj4+Pj4+IGFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8JmNsa2NfcGxsIENMS0lE
X0ZDTEtfRElWMz4sCj4+Pj4+IDwwPiwgLyogRG8gTm90aGluZyAqLwo+Pj4+PiA8JmNsa2NfcGVy
aXBocyBDTEtJRF9WUFVfMD4sCj4+Pj4+IDwmY2xrY19wbGwgQ0xLSURfRkNMS19ESVY0PiwKPj4+
Pj4gPDA+LCAvKiBEbyBOb3RoaW5nICovCj4+Pj4+IDwmY2xrY19wZXJpcGhzIENMS0lEX1ZBUEJf
MD47Cj4+Pj4+IAo+Pj4+PiBkbWVzZyBpcyBsaWtlIHRoaXMgaHR0cHM6Ly90ZXJtYmluLmNvbS82
MDIwCj4+Pj4+IAo+Pj4+PiBTbyBpJ20gZ2V0dGluZyBoZG1pIHdvcmtpbmcgLSBidXQgb25seSB3
aGVuIGRldmljZSBib290cyBfd2l0aG91dF8gY29ubmVjdGVkIGhkbWkgYXQgYm9vdCAoYW5kIGNv
bm5lY3RlZCBsYXRlcikKPj4+Pj4gSWYgaGRtaSBpcyBjb25uZWN0ZWQgYXQgYm9vdCAtIGJvb3Qg
aGFuZ3MgYXQ6Cj4+Pj4+IAo+Pj4+PiAgICAgIDAuMzQxNjc2XSBtZXNvbi1kdy1oZG1pIGZlMzAw
MDAwLmhkbWktdHg6IERldGVjdGVkIEhETUkgVFggY29udHJvbGxlciB2Mi4wMWEgd2l0aCBIRENQ
IChtZXNvbl9kd19oZG1pX3BoeSkKPj4+Pj4gWyAgICAwLjM0Mjc1MF0gbWVzb24tZHctaGRtaSBm
ZTMwMDAwMC5oZG1pLXR4OiByZWdpc3RlcmVkIERlc2lnbldhcmUgSERNSSBJMkMgYnVzIGRyaXZl
cgo+Pj4+PiBbICAgIDAuMzQzNjYwXSBtZXNvbi1kcm0gZmYwMDAwMDAudnB1OiBib3VuZCBmZTMw
MDAwMC5oZG1pLXR4IChvcHMgbWVzb25fZHdfaGRtaV9vcHMpCj4+Pj4+IFsgICAgMC4zNDQ4MzJd
IFtkcm1dIEluaXRpYWxpemVkIG1lc29uIDEuMC4wIGZvciBmZjAwMDAwMC52cHUgb24gbWlub3Ig
MAo+Pj4+PiAKPj4+Pj4gRllJOiBJdCBpcyBhZnRlciBhcHBseWluZyBodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtYW1sb2dpYy9jb3Zlci8yMDI1MDExMC1kcm0tczQt
djEtMC1jYmMyZDVlZGFhZThAYW1sb2dpYy5jb20vIG9uIG1haW5saW5lIDYuMTggKHdpdGggc29t
ZSBteSBhZGp1c3RtZW50cyBvbiB0aGlzIHNlcmllcyByZXF1aXJlZCBieSBjaGFuZ2VzIGluIDYu
MTgpLgo+Pj4+PiBGb3IgVlBVIGNsayBjaGFuZ2VzIHNlZSBodHRwczovL2dpdGh1Yi5jb20vd2Fy
cG1lL21pbmlteXRoMi9ibG9iL21hc3Rlci9zY3JpcHQva2VybmVsL2xpbnV4LTYuMTgvZmlsZXMv
MDMxMi1kcm0tbWVzb24tYWRkLXZwdS1jbGstc2V0dGluZy1mb3ItUzQucGF0Y2gKPj4+Pj4gSXQg
aXMgNi4xOCBhZGFwdGF0aW9uIG9mIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVj
dC9saW51eC1hbWxvZ2ljL3BhdGNoLzIwMjUwMTEwLWRybS1zNC12MS05LWNiYzJkNWVkYWFlOEBh
bWxvZ2ljLmNvbS8KPj4+Pj4gCj4+Pj4+IEFzIGtlcm5lbCBoYW5ncyAtIGkgaGF2ZSBsaW1pdGVk
IGNhcHMgdG8gZHJpbGwgd2hlcmUgcm9vdCBjYXVzZSBpcy4KPj4+Pj4gCj4+Pj4+IE1heWJlIGFi
b3ZlIGhhbmcgaXMgcmVhc29uIG9mIG15IGJhY2twb3J0cyBvciBtaXNzaW5nIGFueSBwcmUtcmVx
IHJlcXVpcmVkIHRvIGdldCBzNCBkcm0gd29ya2luZz8KPj4+Pj4gQW55d2F5IC0gaXQgd2lsbCBi
ZSBnb29kIHRvIHRlc3Qgd2l0aCB1cGRhdGVkIHRvIDYuMTggc2VyaWVzIG9mIEFkZCBEUk0gc3Vw
cG9ydCBmb3IgQW1sb2dpYyBTNCAocGx1cyBpbmZvIGFib3V0IGFueSBwcmUtcmVxIHJlcXVpcmVk
IHRvIGdldCBzNCBkcm0gd29ya2luZykKPj4+Pj4gCj4+Pj4+IAo+Pj4+Pj4gVGhlIHZwdV9jbGsg
b24gUzQgZG9lc24ndCBzdXBwb3J0IHN5c2Nsa19iX3NlbCBhcyBvbmUgb2YgaXRzCj4+Pj4+PiBz
ZWxlY3RhYmxlIGNsb2NrIHNvdXJjZXMsIHNvIHRoaXMgcmVwYXJlbnQgb3BlcmF0aW9uIHdpbGwg
ZGVmaW5pdGVseQo+Pj4+Pj4gZmFpbC4gVGhpcyBoYXMgbm90aGluZyB0byBkbyB3aXRoIHRoZSBr
ZXJuZWwgdmVyc2lvbi4KPj4+Pj4+IAo+Pj4+Pj4+PiBXaWFkb21vxZvEhyBuYXBpc2FuYSBwcnpl
eiBBbyBYdSB2aWEgQjQgUmVsYXkgPGRldm51bGwrYW8ueHUuYW1sb2dpYy5jb21Aa2VybmVsLm9y
Zz4gdyBkbml1IDEwIHN0eSAyMDI1LCBvIGdvZHouIDA2OjM5Ogo+Pj4+Pj4+PiAKPj4+Pj4+Pj4g
RnJvbTogQW8gWHUgPGFvLnh1QGFtbG9naWMuY29tPgo+Pj4+Pj4+PiAKPj4+Pj4+Pj4gQWRkIGRl
dmljZXRyZWUgZG9jdW1lbnQgZm9yIFM0IEhETUkgY29udHJvbGxlcgo+Pj4+Pj4+PiAKPj4+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogQW8gWHUgPGFvLnh1QGFtbG9naWMuY29tPgo+Pj4+Pj4+PiAtLS0K
Pj4+Pj4+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYW1sb2dp
YyxtZXNvbi1kdy1oZG1pLnlhbWwgfCAxICsKPj4+Pj4+Pj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCj4+Pj4+Pj4+IAo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYW1sb2dpYyxtZXNvbi1kdy1oZG1pLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hbWxvZ2ljLG1lc29uLWR3
LWhkbWkueWFtbCAKPj4+Pj4+Pj4gaW5kZXggODRkNjhiOGNmY2NjODZmZDg3YTZhMGZkMmI3MGFm
MTJlNTFlYjhhNC4uNmUwYTgzNjllZWU5MTVmYWI1NWFmMjRkNDUwYTZjNDBlMDhkZWYzOCAxMDA2
NDQKPj4+Pj4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvYW1sb2dpYyxtZXNvbi1kdy1oZG1pLnlhbWwgCj4+Pj4+Pj4+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FtbG9naWMsbWVzb24tZHctaGRtaS55YW1s
IAo+Pj4+Pj4+PiBAQCAtNTUsNiArNTUsNyBAQCBwcm9wZXJ0aWVzOgo+Pj4+Pj4+PiAgICAgICAg
ICAgIC0gY29uc3Q6IGFtbG9naWMsbWVzb24tZ3gtZHctaGRtaQo+Pj4+Pj4+PiAgICAgICAgLSBl
bnVtOgo+Pj4+Pj4+PiAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1nMTJhLWR3LWhkbWkgIyBH
MTJBIChTOTA1WDIsIFM5MDVZMiwgUzkwNUQyKQo+Pj4+Pj4+PiArICAgICAgICAgIC0gYW1sb2dp
YyxtZXNvbi1zNC1kdy1oZG1pICMgUzQgKFM5MDVZNCkKPj4+Pj4+Pj4gCj4+Pj4+Pj4+ICAgIHJl
ZzoKPj4+Pj4+Pj4gICAgICBtYXhJdGVtczogMQo+Pj4+Pj4+PiAKPj4+Pj4+Pj4gLS0gCj4+Pj4+
Pj4+IDIuNDMuMAo+Pj4+Pj4+PiAKPj4+Pj4+Pj4gCj4+Pj4+Pj4+IAo+Pj4+Pj4+PiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+Pj4+PiBsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdAo+Pj4+Pj4+PiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKPj4+Pj4+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCj4+Pj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPj4+Pj4+PiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+Pj4+Pj4+
IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4+Pj4+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo+IDxmaXgtdnB1LWNs
ay1zZXR0aW5nLWZvci1zNC5wYXRjaD4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
