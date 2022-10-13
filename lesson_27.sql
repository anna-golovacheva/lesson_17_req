PGDMP     .                	    z         	   lesson_27    14.5    14.5                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16395 	   lesson_27    DATABASE     f   CREATE DATABASE lesson_27 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE lesson_27;
                postgres    false            �            1259    16408 	   addresses    TABLE     �   CREATE TABLE public.addresses (
    id_address integer NOT NULL,
    city character varying,
    local_address character varying
);
    DROP TABLE public.addresses;
       public         heap    postgres    false            �            1259    16407    addresses_id_address_seq    SEQUENCE     �   CREATE SEQUENCE public.addresses_id_address_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.addresses_id_address_seq;
       public          postgres    false    210                       0    0    addresses_id_address_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.addresses_id_address_seq OWNED BY public.addresses.id_address;
          public          postgres    false    209            �            1259    16426    ads    TABLE     �   CREATE TABLE public.ads (
    id integer NOT NULL,
    name character varying,
    author_id integer,
    price real,
    description character varying,
    address_id integer,
    is_published boolean
);
    DROP TABLE public.ads;
       public         heap    postgres    false            �            1259    16425 
   ads_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.ads_id_seq;
       public          postgres    false    214                       0    0 
   ads_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.ads_id_seq OWNED BY public.ads.id;
          public          postgres    false    213            �            1259    16417    authors    TABLE     l   CREATE TABLE public.authors (
    id_author integer NOT NULL,
    author_name character varying NOT NULL
);
    DROP TABLE public.authors;
       public         heap    postgres    false            �            1259    16416    authors_id_author_seq    SEQUENCE     �   CREATE SEQUENCE public.authors_id_author_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.authors_id_author_seq;
       public          postgres    false    212                       0    0    authors_id_author_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.authors_id_author_seq OWNED BY public.authors.id_author;
          public          postgres    false    211            �          0    16408 	   addresses 
   TABLE DATA           D   COPY public.addresses (id_address, city, local_address) FROM stdin;
    public          postgres    false    210   �       �          0    16426    ads 
   TABLE DATA           `   COPY public.ads (id, name, author_id, price, description, address_id, is_published) FROM stdin;
    public          postgres    false    214   V       �          0    16417    authors 
   TABLE DATA           9   COPY public.authors (id_author, author_name) FROM stdin;
    public          postgres    false    212   b%                  0    0    addresses_id_address_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.addresses_id_address_seq', 1, false);
          public          postgres    false    209            	           0    0 
   ads_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.ads_id_seq', 1, false);
          public          postgres    false    213            
           0    0    authors_id_author_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.authors_id_author_seq', 1, false);
          public          postgres    false    211            g           2606    16415    addresses addresses_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id_address);
 B   ALTER TABLE ONLY public.addresses DROP CONSTRAINT addresses_pkey;
       public            postgres    false    210            k           2606    16435    ads ads_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.ads
    ADD CONSTRAINT ads_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.ads DROP CONSTRAINT ads_pkey;
       public            postgres    false    214            i           2606    16424    authors authors_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id_author);
 >   ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_pkey;
       public            postgres    false    212            m           2606    16441    ads fk_addresses    FK CONSTRAINT     ~   ALTER TABLE ONLY public.ads
    ADD CONSTRAINT fk_addresses FOREIGN KEY (address_id) REFERENCES public.addresses(id_address);
 :   ALTER TABLE ONLY public.ads DROP CONSTRAINT fk_addresses;
       public          postgres    false    210    214    3175            l           2606    16436    ads fk_authors    FK CONSTRAINT     x   ALTER TABLE ONLY public.ads
    ADD CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES public.authors(id_author);
 8   ALTER TABLE ONLY public.ads DROP CONSTRAINT fk_authors;
       public          postgres    false    214    3177    212            �   �   x�mOK
�@]Ϝb.`�V=���Ӆ���UA�r;��~�/7�B颋�����e��@�=j�p
mdpE�sϑ3-����_0����ɑ$6�(� �D�����e�����X���� ?�\�z�{�j�3�����̰_TK{��U��*�4ۡ��o��Jf�wR��˝����,�"���Uʜ      �   �  x��Y�n[��_q4��)ɖ3�t�3J��zR�L-K�dr�֍]�4R$�y���{�_�O�Zk�s��ҁe���s�c������giv���A��f� �����~~��a'd�,ɻ��84v����F�6?�V�/<x��G�U�h�l���l�7��pc�V����Y�-�3��f��4KB�l��OK~ǲW���x���cC~�Z"'8f��p,��'q�������w�-��߳1�a�<�]b�'�@�P�g�!�0?�����j�wϡ�<?�)I��t�Hz>�ӠG<z #� �"p3� �"�!���>��[QK�k��ˍ\���2�fp�H��(.?�`���nx��|�B�<c����%��s|���$�P �v����p%O��C<HhL����2N\Дp����S>��gM�ŵ�eFW�X=z��a/�a�1��ڔ�/*��3��(2Ԛqv�)~{������˟R�؆~\5:�����ey��B7�9�5��`������;�%6��Li)%r��L��4m5���n#{Gd���)_[Jv� 
u~���M~V���T+K���Z9�W���-���|N	|��7�b�$� �a)�$%��6i��Upޮ�32e0�w ؝Ư��w��o��������<���_>����U2�K��0\�׹i?m%ڷ`�	<2#��/?���:�W�^◉T1�[������?�p_W���d$[,�`���ںu}�E/��0���-�vc�Kp3Y�M  ��Pmm*��$aQ�+��F���<}���ʐ��9���#��X|$6�Ӱ�A,�����EKL���4Ri����⧐�%;Hګ��� ��7����Ӥ��������w�v���l(�(��j_�f�<	��z Vm� ݺ�Z�{@�R?��gV���Q���E~��4t�-ɩ�CW�F�<�
��J��}����=��1�[�D����Z�g����P��$�fL�
�����c[��=��PdS���
"+�%r�?CHl��~����fS3"�۱#��tpcp��h���<Qfg@ʈB=I���8C�I�OG��:D��*=����#ϥ��%�b��QT�4�*l�B�W�"%+�1O�l�O,��� ^3��a&�)8,֤�"�*0���R���"�o,MGvFp[QTr�%���$Y�d}�������J��u�˘˭�K�s�n��h���tj�<�,lM/|nF���'O?JFf���o���a��QFB#�0%�8�2�\Y���ja�E,[�ƞ��
������/i}"@��5��ۗ/�.�I<���sn�X?gi��3u'Y�R�����C��XX9Ә�O�VE�ӏ�B��@$Q�x�݂�æ�o�Ѻ��D	��~D`b�/ҡ��D)�Ky,�$N�hez�E���-�������|���F�����J��ګ�{�#g�*�N3�9��)����6���n�r��H���4��s5b0d������y�_^�y���DtS�[	��_��.�(`Ɵ��Kuf�Yn-�y�[/D���o+��AEKñ ƚ���D����J��'����խ��Z)k{��3/佔m�i����+��gDO�O�~Z��@i`U*P%���ba�-���DE`7�8�b�����Nm7v��w�wo!���7�0_נ��ĉ�V[�QcRN|�`�{f��G�ӆ
����h>i��6WCd��A�m����Jb�ľ�״u}����[�Sʹb��(^�E��ɰ�f�n�P'|��V�)|F��0���A|n ����^��J?x�@�����j��a�-�����ƬSyذj������%_X[C}QV��^�vR�ObkR5�U�m�ݑX���H�w�.�͆�ݳ�|$ֵ,�q�Л<�eF�OF ���.�^B	�l9!85��lw:6�r�����\ħ :��6P@'� `�!n��*��M�ζ��&��Z�3sWui�z����p�6���}���Py��я�!ʮ�NJ����,��M���X�H��!�8}�ů�$���! ��-���#�>����9��i����F;� {��,����%R����|�]��'@t���V�>����Ba�r�������FsKLT	M�3�t�#%Մm�ۢ�mʹ��)K�n�W����+#+������p�7�Ũ�--��apL�jm��*Hf��Gmt֌��IDx���$M[�����������딑�8NkRc�;(��Kmz�8���T���q"���u�v��l)d	�"��
�իm����3�mז��P�|��*I��nIl�M������iO��}F�G��=Qm4��(>,,SظX�6���e��4�ס��I��"̝�-���x%PD�0��2���l���V���>@)<7U{p�T���2���X��-��VA7u����A�������k[���""w�*|�R�3�>�"x���F{g�V��oCb7��n������4�Dc���~:�Ң�eQ�\X�S{8�N)m����R΢)8(�ZksXLB���ܻ��Śe����a������W��^ roׇ�X��5�`�ҷF��&ݾ ⺈h߫�l�Zj�)վTg�)�;�m�꽚�`=�U`�O��9����X��%�lz���ԅ�W��f6�+Jx�N��a�E�����-n��o�O�硽�������V����;hA��ݲ�ح��G]�6�Bc!�c���3o���%�^�@����ٷx�O��"{m)����`�9��`�;3�P��.��d5�.l-���1��6��TH�:�a�Zh�+4�����b����{9P1�եa���(�	/��G<���<��Y�f�u�]�����/�}����׹�b3t�W��W��B�uq2�\r(%/�v����r\Q�E�V��H8�8��(s�f/�_K"��]���?�����ӈ�A��keG��Oe�������v�F��4��Dߚ�r���S1�𤬐�؞�5G�U�b�ଚ��u�ƍ�	�'      �   W   x����0C��0H|�a���3b�
�REEgp6"9>�Ͻ�b�ˢ�	��db��3����̊�!kԀY��i0k�"<l����o����4     