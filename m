Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2279CAC5B8
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Sep 2025 19:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qJhNvae3SiUb+qET8R4C8Fdra+pqd0qGNW1qLUMQX2c=; b=e6ARB+gPSrBm5j
	/NT3AmRecWkuuZJJX2gRZjrOKmmo/6i4Qmw/YMfQwYZeuuEEUEUDZptTLcnLMwp05mTACD6uaUyHX
	pVkox+HvOml66m3qKgOIIu96VBoNbnAQROKaWpgxQNdJkYUwpe2bw/XtVRn7bQnWSywU8Qy429dcd
	M2miKpGcqSzWGUnIiyLiNOTsK8BYgB8eGpfdyxCxjl2nY1hrXFwkZxCAZ5ZHWgwGR4JiZKprCdYLO
	4JdbvoCAOwZjhRkpOQ+m0OTIhFd5evY2J9ELs/DKu7Az5WqDcMTUudO5FtwwFEkSqHkIqczXK5nkv
	mJuawkIkeuuIx0ObIekA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Dus-00000003sJG-15HD;
	Fri, 26 Sep 2025 19:15:38 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Duo-00000003sIu-3qU3
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Sep 2025 19:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1758914132; x=1759518932; i=markus.elfring@web.de;
	bh=/aNc3teXYyRj8ni9DWq0KsAHiheGNzF92SpFUNfa2LU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GMjmS1D3TuXHDXQYGp9CpuGQ/R7d9HC0XVOeD3/4060a1KYUL7oAaqwUExCvo288
	 bwvsyJXTBk2TAcgFm+kQNxSPbyOYe25G1IqgRQ8rjN0/rYgEuRVbvmFfpPzEIAmz3
	 MTlgMMgE77lJh3ddfbrEIc90D0QvxGWs0c2ZgoGDhHaoAiItmZBZMDKtqSzV2Ax6x
	 ehrwLdHaR/RkP7N2vxeUwRW6xOp1tEUFJ6fur+BcYdEqjZBrW64JoCJFXFuzIfxB4
	 8QMnyX18mKL4GhQ5fdNDhoSRZQcjF3qmZbJP9SGUNstWBMFmdXhPOCHnWZ085aufU
	 PFZVEfSGPmMTfwEvrg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.192]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M43Kc-1v2Dum2ASW-00FDEK; Fri, 26
 Sep 2025 21:15:32 +0200
Message-ID: <bf33acbe-a9c3-46aa-affc-34e416a4b1e3@web.de>
Date: Fri, 26 Sep 2025 21:15:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Johan Hovold <johan@kernel.org>, linux-amlogic@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Yu Kuai <yukuai3@huawei.com>
References: <20250926142454.5929-2-johan@kernel.org>
Subject: Re: [PATCH 1/2] soc: amlogic: canvas: fix device leak on lookup
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250926142454.5929-2-johan@kernel.org>
X-Provags-ID: V03:K1:7zutT7CJ+1VskfKbD0bGNLbj29yEZTSD4JnkB/k295iRRDDIN06
 lpooIXBRfdflodsh62weAFORNJPlvT8SQfJ/HjDTBcY/Uh1lgid4h9CZYWzuiPzfrffJAfR
 edrO69DTU80m0mL7lpmn57p24smZqxjDixN29Csa5EWE0S+N56AQyC5LJjzGYm/S/nzQrNy
 FL/e3Cv4JJqfsN3wPUcHg==
UI-OutboundReport: notjunk:1;M01:P0:I07t/8RDwME=;SAifApDTNhX6zDPY2Rei6+mS7Kl IHuVQobga0pzRmsKOfkKIrQj96211lohlcZLPNpXyAVKfo8nzC1lUn1EIaFou+LM8tgM7e3w1 raCXlHDjaY+94/Ge1UbUZA267pFhCZuloW0q6qZZvrhmWKJLUZzuhVMIuObDs5e1I53TldGBI SO9uViuwkffgB8ayw/7WIN+kPns5LXBhujuhRIRw8DTKTllAp/VNzfaAjqwHGeJ7IfsCkM5wq zDOqfLI19rw14LCPET5DJZQ3xe7WKoTbOqLw2eTQ44Aw30Xn0+79FFpe3JH8yFimsS1kr/8xy 7rYVA2997f23t9nD23Z9VLwFAnDpxpwq8DAFPbaurqaXEDxRB0US2taz+gR3xu5IoLTiacWX6 VWdeNJ3wpf6/cSSo8bLu2ZxzkB9/8pLX2bTN7T/qKxrmxJpgz/yb+5wO5/pQBuzVSQVnOccD8 8lAA+aKQ5Gsq5bjolDU0BulpfYmAGDKSVOaZnbsTmzVukzdXqWZe4yz33eKouIjLPHxjQGsi+ ai/sVvuStaoEYFYTu87H+NoPVFj+pVfofPrldOoqK6x1d/RMljxk5KxXlN1wi3/5uwl6jle3o jlTJv4CIdHVFCX8dHirdbpXaAmITreH7EyPy62ItHVwoBpCgu03Up1RMKve3jf7yW1fhXqdPY /16m9ztS3Nfs9A9Gv9bWidQox2MqjHxPgy3LD3/aLIDindvtidu5cUhzByHphvv4xp0N5pEwa /N6SEViaO0wmAkha5vLnFPIGYSJOe9UBBgTghgIcdvffVmj4Xz8iLIqJWxqiXG3Kh8OYt8Ix8 kF9xwAdql1AuyW2OCY//7iO17xK4YbvKzl5lycb/wS6YQtR6LVwHKI9au3owAb6eNj+qBEW9k iUJhyooP1/pE67YolkDULNNRGevLobimup9ZK+88/+QyGC5sk1GAz4PbjWwaok4mm9lkozYz/ oizl0ZJ+Sa8eK6xHMwj6TQV8tCeeUJV2REh+kLqhEnSZ5AiAgjiX2xJQHHyw7C+aoOywPFsvO +TFOr8OREMBbOe1GLBYOGHfnGyTJR6h1iiVbzbrL9UgxB6lnVKBDVLPAiwvNe5lHfoD+/hKnF SzmbSiXbwFMUTSax3c9CI6ZkDg5mKWT7e6708SwEoIckx0D9iNKM1m5bf2GS5TkFCgjCTXV2j HvOTkvRvferVsNPOahZzx1oJ6pLjJA0G8fWxC707HswHMahrDHR322GHSZ+WbTE/DQpc+Y471 AFb83UCKUmsAGjxcS2LNRq/K69knFaZvRxmfWNFUr/z9Z52AWeFPuDZ3mHZt+B+WIP9x8e+cH HpxPiPIAgJjzDsJZ6OrOqpw+PbRrawqPgtz9e2rZ2qEwRamnX0hNkllvgvN2A1RPmzwYA0b4B hnZej27v1R1gep+1iz+UjqZc05R1MP9voKU9gydenjFbmyQJf+BFwCmVcm/VDS3vCngjm/FTN /zYq9HaO2pbtRV9t+opStCQ/0iyKTyIB4D3eHBuwRSopFgh2CcpVnkJVNICX/T/QAk/ON7/9i iiKhqDy09GQQHqk4YwAlUsCQ35irqLlL6VWd2l6dGX4iUc6fNbtkYB3PgQ10rR1DPtMaBlKYN 6qfezxxkJ4iO5BbYI/lq2M+vysKBOQWUt6glHfgeXlv4zhOWXfsZnu/biDgTRBuu89KbbxDOh IdMb9lxnRMOYfFoyuctboKLjXy1az/o9Jqma9q9d7lIS7U4hbyy9OIz6k314ZhoAkQhXQGO5n aVD7znlJn5aPAqwRhDCZAFyQ0zMwrlA+0t5SBSzxj6qtl/rry1am4674BgIv/px8Om1qOOxFu we+OUa6xV9RiysgkvtNvFvTMw+V0tnfn3a730SkdCJlbItVegFIADZFQ22dRmAopH0QP6/5kl HCXsd4c/5tER0eKrvN7276VgC3da2NWqhhTtwkGdHJGcN4yd65vaijQ+W/xgAfToP2liEVc9r mfj29EIMQ+1VCF6BtjFQuwF8SQUKfzgt3WM7bqYi5Wk46aNcejYpxBcZW25u4jtW9msjQoSCW blPnDMG+60xcD8ee5k0ofGC/LrofUNKOamXSrx9g/rrlYriPXdnZ3QebRILxh0KKIN/ZPFHYI z70vj+bXlsfG5S3izNQ1H62LBI7SKkujUO6u17Q+ZqNwpPx8YIKC6I4Ib/Rz6qCRy+u73um3F Sr7D9UfU96QQvZcQ5p4x4fIy/qAFw2CyCaUVhchtVz3NzW8JVp/yt1+XQGm2Bb+VZeRvqQFIc WHh8ZJWD7PNZhgpUl+360eX3kSJ0z4pRZOo4mkUaf1ysCijWz5RTcesfCJerDCLKeycFodxm8 NKbBYxPgvmjxPdm+R2c2I3olSFG9DDre1P8PlirDK+fG+GEWIvSxWpCeGuFsidwyoSMQjxJgi qTibD4Cmw3mzsYONtaw+gpI5wHc0mJHQH+kgpeCS1tOF4w8/rKVNOjLu5gMctu9EnS+atmnTZ FDmTSW9ixQ5T8PTrTw8Pnts2IjcUQDLLYBG/i3isIOEZLFTtDoPx+lxpL4I+PEuiW5zeHKawc map6bOYBs4QxoAUliUhp+Vf+UlM+XSwE34Y0H+5sy+9k1xdEhhWQPVhqyXJRITB38/dENE387 G+YQct8quv4z/osyhHjVoODX48O7Q8mpSSEJK/jEEPMk6UZi54veBRuz7spGxe9+FKAPqpoAX xZShCXiP5iaeDaQ2yCIwxORa1ZUOW6derBQHC23rIxzyW1QhFTZBN2ss2jRoljWe6beVs+6zB 1EttA1z2kArdiGHpcVriEuWWZzSISQZRJYfTfY033R2SXA2iH4iyKay3Gi4Y/XyNPmCGeAZth CyDzKb3hR96f9JblUSEEB1+dpduqZFMBWGZZDn/agTS46n+4U9sf2e/XL4YsLrZ87dztPbCSW 6VLtKttY+QYkv9HMVndBV33nTKCTScKTc9+9abwlxmOf74z88rS/qCmTC+IPrVFAK5anJxxhb nA2iu3VIScx0CjuoQK274drhKJ6a9FGSLCALjnPouEY7Sy5DEQ4UwWXF6byOo/bybmLRPq2EJ GoQQU3Qe19asRrr8F4qSawSrtFbH/ltxviQdVleNg7nI9Sv6hU/ljmBPwhkfta6U0Z2PCFEVt /znx+cnlOkupPQvZIfrK5NEKdektqdUGr0J5wyzmnbWwIocncSI/6QVfiYkb9Y1ma57qckXuM EfcqPsQXzbZMHKmvVFDcG+pnL3vTaEecoNz2tFcUOcW33xBS9D/cPBTHCuEuevIqECOnUGg5y ZLH3NDNDEO2udQMZAdSpS63lxhld3fJ8h029Nm8SfCBodVP3HITueodayn2GgAieaJNc2iKYT BE5du98DFyIdP+PXG9o5CtUP8aOqr2FYiOiSru2CzZqTiFZxh2kb9qXG2+RqB3ozOUACVZfH5 ezNXTmFuESkgxOdhx42Q1Mt16anfztv/HqwwRWJIISgKBZO8jpKheR87Bt5tN/MTBthcWvnRS uKwW30bD7jc7lFeSwJKQIyggwDHn6qbDAceYscYzurASJQiatOLtDRf5s4NHEtc/LGgVIZ81U jYIGxW5caxNnBJmPqxY3TsP8hQJgiEl2qh26csK7vYBiSht1d7m3pZx58qwc/kCso9onZnPb3 YQkaavnXlZK5m7hc1c533RVIUcbgHLmbxgpTxyY3ivE4Rdsm/u8nEt/nLqfGJQ0tpyVAjLKty S966VytU7dppN0E6kze+EjERCdw21ylJepDqWRHn2+nZx3iDMuM8TuB2JRbTx/cNxvrolxWOE MEREcswOHKexyxY4veISFGrNDzrey/nPJBWfMPi6J3DaAbF21xc26mqUV5nGVpHLQMlHmfbMJ D5i+HBJE7wZlqkTYCKvwcK6iZYg5AVRwGIQkuSwDiFvfJ0M7l9vkmCki7C4PgfPAfDpiTKqEr
 KLE7S9ikqilFSYcHU6685dhmc/i1FLkQPV28YitiMZQbrHmDo7CNZ3z30R/3ntI1Ln6UH0aXR TsGM6sov4rarJxocx8klVa+5CWJi92Q+WGTPHdpqyDZ+VqEk16+Jw8Fdaxb43DyRLdW4+kEn1 wGeNIPuSzKFOfZ6NwHTacGn7hMFyWk8ruVb0cWbmK2i8xfJ3XtP4mE533aEm0BFzcpSZc82B/ pEj2yhv3iNWQW+vHY+CJXHibVMpl9ggIAoZYVL1CXRmKtzvLQMIFPZPrdPkGipgn4NY/G+wvB GxClwFWcT/PKU3Gm9NZlTCkepYgvlumkXQ+P+xDdLGDSZhkbMXRu6WTDHxEICW8WtYf6xzv3v fguDjJ9LIsFcdMSeW0lgiEY2GI4TnB1FUHo4KTWce4jNygofwplUb+3RdzxWpSYqSHwRf5HyJ swWqHR8dI/xThOpHg+QEEztRtZZ2Yyoc5kcvcJ/y6hkqD/0MH4HuWQPwQsBK/pRsFxcTgdfyt K0yS9jlWKiCofNpclCNcndHROMFoJbavJPNVmkOKVAaY9NNzoAEURcsONPhPtF0w4I7+eW49Y 4pLBIdWYRxMSwc9ezRo5Dz08O6HPlpp4GptDl0SV14CG08er0pOpHroBq9Ab+WveHAmZ0hmKx yDzCnfmpF4kCl1jPQR3bEFHF5W0VT2pfFKB5gNTayVHEDYR5QrTsQkseEHOYXaMzIb6uBt9cw yf6TXotzPtrIGjE8DUp1btK1Wtlu0pAoX1Lliv8KQ4Is0OKl2C5vxGdPqtcIInH8BG2A5S3eB qiJFyHRdHWpdKhVDeYdcamMwmljbzRt5XtazytMurSBxL+taha8rT8elXH8Cxp8j3PEnaXhuY Hr6D9GG5AFhx1NZyFQiDYuu4xjT6yz+Zm8UzMTQtkEiXddmpQRxBMlXp2+O5hZPhFs1E6tfRi VyjqGIcYSFvjha3diGNizoNDBzSo2z7VXz2v3+RV5nOU5+cD12mdI2pNzQq9QOm5vWvJOi61D FjocTRrptub2b4gCZtYAkMSQzDWcDe1EkRB9oK6WBEVM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_121535_331142_F6C21F01 
X-CRM114-Status: UNSURE (   3.39  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

PiBNYWtlIHN1cmUgdG8gZHJvcCB0aGUgcmVmZXJlbmNlIHRha2VuIHRvIHRoZSBjYW52YXMgcGxh
dGZvcm0gZGV2aWNlIHdoZW4KPiBsb29raW5nIHVwIGl0cyBkcml2ZXIgZGF0YS4K4oCmCgpIb3cg
ZG8geW91IHRoaW5rIGFib3V0IHRvIGluY3JlYXNlIHRoZSBhcHBsaWNhdGlvbiBvZiBzY29wZS1i
YXNlZCByZXNvdXJjZSBtYW5hZ2VtZW50PwpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC92Ni4xNy1yYzcvc291cmNlL2luY2x1ZGUvbGludXgvZGV2aWNlLmgjTDExODAKClJlZ2FyZHMs
Ck1hcmt1cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
